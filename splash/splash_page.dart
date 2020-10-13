import 'dart:async';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/widgets/app_logo.dart';
import 'package:mycarts/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController _splashController = SplashController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5), () async => _splashController.init(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(height: 100),
            SpinKitThreeBounce(color: AppColors.button, size: 25)
          ],
        ));
  }
}
