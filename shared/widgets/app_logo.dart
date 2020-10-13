import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double height;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  AppLogo({this.height, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (height == null)
      image = Image.asset('assets/png/app_logo.png');
    else
      image = Image.asset('assets/png/app_logo.png', height: height);

    return Container(
      height: 100,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      child: image,
    );
  }
}
