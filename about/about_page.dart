import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.button,
          title: Text('حول', overflow: TextOverflow.ellipsis),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: AppColors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.white),
                onPressed: () {})
          ]),
      body: Observer(
          builder: (_) => Stack(children: [
                SafeArea(
                    top: true,
                    bottom: true,
                    left: false,
                    right: false,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalization.loremLarge,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19)),
                                ])))),
              ])),
    );
  }
}
