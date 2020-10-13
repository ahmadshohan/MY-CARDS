import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:flutter/material.dart';

class SendEmailNoticeDialog {
  static showSendEmailDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              contentPadding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              children: <Widget>[
                SizedBox(
                    child: Image.asset('assets/png/sendCase.png',
                        width: 50, height: 50)),
                SizedBox(height: 10),
                Text("AppLocalization.yourRequestSent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                SizedBox(height: 10),
                SizedBox(
                    height: 40,
                    child: JRaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, AppRoute.loginRoute);
                        },
                        text: "continue"))
              ]);
        });
  }
}
