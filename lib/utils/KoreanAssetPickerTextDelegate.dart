import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class KoreanAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const KoreanAssetPickerTextDelegate();

  @override
  String get languageCode => '한국어';

  @override
  String get confirm => '확인';

  @override
  String get cancel => '취소';

  @override
  String get edit => '수정';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => '불러오기에 실패했습니다.';

  @override
  String get original => '원본';

  @override
  String get preview => '미리보기';

  @override
  String get select => '선택';

  @override
  String get emptyList => '목록이 없습니다.';

  @override
  String get unSupportedAssetType => 'HEIC은 지원하지 않습니다.';

  @override
  String get unableToAccessAll => '접근권한이 없습니다.';

  @override
  String get viewingLimitedAssetsTip => '앱에서 액세스할 수 있는 자산 및 앨범만 봅니다.';

  @override
  String get changeAccessibleLimitedAssets => '액세스 가능한 자산을 업데이트하려면 클릭하십시오.';

  @override
  String get accessAllTip => '앱은 기기의 일부 자산에만 액세스할 수 있습니다. '
      '시스템 설정으로 이동하여 앱이 기기의 모든 자산에 액세스하도록 허용합니다.';

  @override
  String get goToSystemSettings => '시스템 세팅으로 이동합니다.';

  @override
  String get accessLimitedAssets => '제한된 권한으로 계속합니다.';

  @override
  String get accessiblePathName => '접근 가능한 자산';

  @override
  String get sTypeAudioLabel => '오디오';

  @override
  String get sTypeImageLabel => '이미지';

  @override
  String get sTypeVideoLabel => '비디오';

  @override
  String get sTypeOtherLabel => '기타';

  @override
  String get sActionPlayHint => '재생';

  @override
  String get sActionPreviewHint => '미리보기';

  @override
  String get sActionSelectHint => '선택';

  @override
  String get sActionSwitchPathLabel => '경로를 변경';

  @override
  String get sActionUseCameraHint => '카메라를 사용';

  @override
  String get sNameDurationLabel => '기간';

  @override
  String get sUnitAssetCountLabel => '개';
}
