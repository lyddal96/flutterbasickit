import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertUtils {
  /// Alert
  static void showAlert(BuildContext context, String title, String content,
      String buttonTitle, Function onPressed) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return CupertinoAlertDialog(
        //   title: title == '' ? null : Text(title),
        //   content: Text(content),
        //   actions: [TextButton(onPressed: () {
        //     onPressed();
        //     Navigator.of(context).pop();
        //   }, child: Text(buttonTitle))],
        // );
        return AlertDialog(
          title: title == '' ? null : Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(buttonTitle),
              onPressed: () {
                onPressed();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  /// 토스트 보여주기
  static void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: Duration(seconds: 1)));
  }

// showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel:
//         MaterialLocalizations.of(context).modalBarrierDismissLabel,
//     barrierColor: Colors.black45,
//     transitionDuration: const Duration(milliseconds: 200),
//     pageBuilder: (BuildContext buildContext, Animation animation,
//         Animation secondaryAnimation) {
//       return Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width - 10,
//           height: MediaQuery.of(context).size.height - 80,
//           padding: EdgeInsets.all(20),
//           color: Colors.white,
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   text,
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     });
}
