import 'package:flutter/material.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:animations/animations.dart';

class AppDialogs {
  static successOrderDialog(BuildContext context) {
    return showModal(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400)),
        context: context,
        builder: (ctx) => SimpleDialog(
                contentPadding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                children: <Widget>[
                  SizedBox(
                      child: Image.asset('assets/png/sendCase.png',
                          width: 50, height: 50)),
                  SizedBox(height: 10),
                  Text(AppLocalization.yourRequestSent,
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
                                context, AppRoute.ordersRoute);
                          },
                          text: AppLocalization.continueLabel))
                ]));
  }

  static successCartAddedDialog(BuildContext context) {
    return showModal(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400)),
        context: context,
        builder: (ctx) => SimpleDialog(
                contentPadding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                children: <Widget>[
                  SizedBox(
                      child: Image.asset('assets/png/sendCase.png',
                          width: 50, height: 50)),
                  SizedBox(height: 10),
                  Text('تم اضافة المنتج الى السلة',
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
                                context, AppRoute.shoppingCartRoute);
                          },
                          text: AppLocalization.continueLabel))
                ]));
  }
}
