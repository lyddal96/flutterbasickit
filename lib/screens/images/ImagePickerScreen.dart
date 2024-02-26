import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kit/main.dart';
import 'package:kit/models/Apis.dart';
import 'package:kit/utils/AlertUtils.dart';
import 'package:kit/utils/ApiUtils.dart';
import 'package:kit/utils/ColorUtils.dart';
// import 'package:kit/utils/KoreanAssetPickerTextDelegate.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
// import 'package:photo_manager/photo_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  CroppedFile? _croppedImage;
  String? _filePath;
  final picker = ImagePicker();

  /// 이미지 가져오기
  Future _getImage(ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      logger.i("카메라");
    } else if (imageSource == ImageSource.gallery) {
      logger.i("갤러리");
    }

    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path);
      _cropImage(_image);
    });
  }

  /// 이미지 크롭
  Future _cropImage(File? imageFile) async {
    if (imageFile == null) {
      return;
    }
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '이미지 자르기',
            toolbarColor: ColorUtils.FF333333,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '이미지 자르기',
        ),
      ],
    );
    setState(() {
      _croppedImage = croppedFile;
      File file = File(_croppedImage!.path);
      fileUpload(context, file);
    });
  }

  /// 권한 체크
  Future requestPermission() async {
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      // 권한이 있을 경우
      AlertUtils.showToast(context, "권한이 있습니다.");
    } else {
      // 권한이 없을 경우
      AlertUtils.showToast(context, "권한이 없습니다.");
      await PhotoManager.openSetting();
    }
  }

  /// 앨범에서 이미지 가져오기 다중 선택
  Future _getAlbum() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
          themeColor: ColorUtils.FFF6D54A,
          textDelegate: KoreanAssetPickerTextDelegate()),
    );

    _cropImage(await result![0].file);

    logger.i("결과 : ${result?.length == null ? "없음" : result!.length}");
  }

  /// 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _croppedImage == null
                ? Text("선택한 이미지가 없습니다.")
                : Image.file(
                    File(_croppedImage!.path),
                    fit: BoxFit.cover,
                  )));
  }

  /// 이미지를 보여주는 위젯
  Widget showImageWithAPI(String? filePath) {
    logger.i("FILE path = ${filePath}");

    return Container(
        color: ColorUtils.FF333333,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _filePath == null
                ? Text("선택한 이미지가 없습니다.")
                : Image.network(
                    _filePath!,
                    fit: BoxFit.none,
                  )));
  }

  /// 이미지 선택 Bottom sheet
  Widget _imageSelectBottomSheet(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                _getImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text("사진 - 기본", textAlign: TextAlign.center)),
            ),
            Divider(height: 1, color: ColorUtils.FFDDDDDD, thickness: 1),
            InkWell(
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text("갤러리 - 기본", textAlign: TextAlign.center))),
            Divider(
              height: 1,
              color: ColorUtils.FFDDDDDD,
              thickness: 1,
            ),
            InkWell(
                onTap: () {
                  _getAlbum();
                  Navigator.pop(context);
                },
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text("갤러리 - 스냅챗")))
          ],
        )
      ],
    );
  }

  /// 이미지 업로드
  void fileUpload(BuildContext context, File file) async {
    try {
      final client = ApiClient(ApiUtils.getDio());
      client.file_upload(file).then((value) {
        if (ApiUtils.isSuccessResponse(context, value)) {
          setState(() {
            _filePath = "http://p.api.rocateerdev.co.kr/${value.file_path}";
            // showImageWithAPI(value.file_path);
          });
        }
      });
    } catch (error) {
      logger.e("errror ${error}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: '이미지 선택'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        isDismissible: true,
                        clipBehavior: Clip.hardEdge,
                        builder: _imageSelectBottomSheet,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))));
                  },
                  child: showImageWithAPI(_filePath)),
              SizedBox(height: 20)
            ]),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }
}
