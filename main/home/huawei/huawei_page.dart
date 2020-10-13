import 'package:mycarts/main/home/huawei/huawei_page_controller.dart';
import 'package:mycarts/main/home/widgets/huawei_tab_bar.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';

class HuaweiPage extends StatefulWidget {
  @override
  _HuaweiPageState createState() => _HuaweiPageState();
}

class _HuaweiPageState extends State<HuaweiPage> {
  HuaweiPageController _controller = HuaweiPageController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.1,
            backgroundColor: AppColors.button,
            title: Center(
                child: Text('HUAWEI',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center))),
        body: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: Stack(children: [
              Container(
                  height: double.infinity,
                  child: Column(children: [
                    Stack(children: <Widget>[
                      Container(
                          height: height * 0.27,
                          width: double.infinity,
                          child: Image.asset("assets/jpg/huawei_tec.jpg",
                              fit: BoxFit.contain)),
                      Padding(
                          padding:
                              EdgeInsets.only(top: height * 0.17, right: 20),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.huaweiBg,
                              child: Image.asset('assets/png/Huawei_Logo.png',
                                  width: 120, height: 120))),
                    ]),
                    Expanded(child: HuaweiTabsBar()),
                  ])),
              Visibility(
                  visible: _controller.loading, child: Center(child: Loader()))
            ])));
  }
}
