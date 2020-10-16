import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/app_route.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/shared/widgets/app_drawer.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/home/home_page_controller.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController _controller = HomePageController();
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {});
    // _controller.sliderHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.productsList;
    return Scaffold(
        key: _key,
        drawer: AppDrawer(),
        body: Observer(
            builder: (_) => SafeArea(
                top: true,
                bottom: true,
                left: false,
                right: false,
                child: Stack(children: [
                  SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        _buildHomeBar(),
                        SizedBox(height: 12),
                        _buildNewProductHorizontalList(),
                        SizedBox(height: 12),
                        _buildSpecialOfferHorizontalList(),
                        SizedBox(height: 12),
                        _buildGamesPlatformsHorizontalList(),
                        SizedBox(height: 12),
                        _buildNewProductHorizontalList(),
                        SizedBox(height: 12),
                        _buildNewProductHorizontalList(),
                      ])),
                  Visibility(
                      visible: _controller.loading,
                      child: Center(child: Loader()))
                ]))));
  }

  _buildHomeBar() {
    return GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height * 0.27,
          child: Stack(children: [
            Positioned(
                child: AppBar(
                    backgroundColor: AppColors.button,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        icon: Icon(EvaIcons.menu, color: AppColors.white),
                        onPressed: () => _key.currentState.openDrawer()),
                    title: Text('الرئيسية', overflow: TextOverflow.ellipsis),
                    centerTitle: true,
                    actions: [
                  IconButton(
                      icon: Icon(Icons.search, color: AppColors.white),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.shopping_cart, color: AppColors.white),
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoute.shoppingCartRoute))
                ])),
            Positioned(
                top: 50,
                right: 10,
                left: 10,
                height: MediaQuery.of(context).size.height * 0.19,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/png/temp_news.png",
                      fit: BoxFit.cover,
                    )))
          ]),
        ));
  }

  _buildNewProductHorizontalList() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("اخر المنتجات", style: TextStyle(color: AppColors.black)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoute.allProductsRoute,
                      arguments: {'title': 'اخر المنتجات'}),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button)))
            ]),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (ctx, index) => InkWell(
                  onTap: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(children: [
                        Expanded(
                          child: Image.asset("assets/png/temp_news.png",
                              width: MediaQuery.of(context).size.width * 0.35,
                              fit: BoxFit.cover),
                        ),
                        Text("الأكثر مبيعا ",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12))
                      ]))),
            ))
          ],
        ));
  }

  _buildSpecialOfferHorizontalList() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("عروض خاصة",
                  style: TextStyle(color: AppColors.black, fontSize: 17)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoute.allProductsRoute,
                      arguments: {'title': ' عروض خاصة'}),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button)))
            ]),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (ctx, index) => InkWell(
                        onTap: () {},
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(children: [
                              Expanded(
                                  child: Image.asset("assets/png/temp_news.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      fit: BoxFit.cover)),
                              Text("الأكثر مبيعا ",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12))
                            ])))))
          ],
        ));
  }

  _buildGamesPlatformsHorizontalList() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(" منصات العاب",
                  style: TextStyle(color: AppColors.black, fontSize: 17)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoute.allProductsRoute,
                      arguments: {'title': ' منصات العاب'}),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button)))
            ]),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (ctx, index) => InkWell(
                        onTap: () {},
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(children: [
                              Expanded(
                                  child: Image.asset("assets/png/temp_news.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      fit: BoxFit.cover)),
                              Text("الأكثر مبيعا ",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12))
                            ])))))
          ],
        ));
  }
}
