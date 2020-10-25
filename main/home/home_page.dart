import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/main__page_single_product.dart';
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
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      _controller.productsHomePage();
    });
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
                        _buildNewProductHorizontalList(products),
                        SizedBox(height: 12),
                        _buildSpecialOfferHorizontalList(products),
                        SizedBox(height: 12),
                        _buildGamesPlatformsHorizontalList(products),
                        SizedBox(height: 12),
                        _buildNewProductHorizontalList(products),
                        SizedBox(height: 12),
                        _buildNewProductHorizontalList(products),
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
                      onPressed: () {
                        showSearch(context: context, delegate: AppSearch());
                      }),
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
                  child: Carousel(
                      images: [
                        Image.asset("assets/png/Mask.png",
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high),
                        Image.asset("assets/png/Mask.png",
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high),
                        Image.asset("assets/png/home-slider.png",
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high),
                        Image.asset("assets/png/home-slider.png",
                            fit: BoxFit.fill, filterQuality: FilterQuality.high)
                      ],
                      // images: _controller.sliderData
                      //     .map((slider) => GestureDetector(
                      //         onTap: () => Navigator.of(context).pushNamed(
                      //             AppRoute.musicPlayerRoute,
                      //             arguments: slider),
                      //         child: slider.contents?.avatar1 != null
                      //             ? CachedNetworkImage(
                      //                 imageUrl:
                      //                     "${SocialMedia.urlPrefix + slider.contents.avatar1}")
                      //             : AssetImage("assets/png/temp_news.png")
                      // CachedNetworkImage(
                      //     imageUrl:
                      //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                      // ExactAssetImage("assets/page_design/home_page.jpeg"),
                      // ))
                      // .toList(),
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: AppColors.button,
                      dotPosition: DotPosition.bottomCenter,
                      indicatorBgPadding: 5.0,
                      borderRadius: true,
                      moveIndicatorFromBottom: 180.0,
                      noRadiusForIndicator: true),
                ))
          ]),
        ));
  }

  _buildNewProductHorizontalList(List<Product> products) {
    final newProducts =
        products.where((prod) => prod.category == 'bitmap').toList();
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("جديد المنتجات",
                  style: TextStyle(color: AppColors.black, fontSize: 15)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoute.allProductsRoute,
                      arguments: {'title': 'اخر المنتجات'}),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button, fontSize: 14)))
            ]),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: newProducts.length,
                    itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: newProducts[index],
                        child: SingleProductMainPage())))
          ],
        ));
  }

  _buildSpecialOfferHorizontalList(List<Product> products) {
    final newProducts =
        products.where((prod) => prod.category == 'bitmap').toList();
    final reversedProducts = newProducts.reversed.toList();
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("عروض خاصة",
                  style: TextStyle(color: AppColors.black, fontSize: 15)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoute.allProductsRoute,
                      arguments: {'title': ' عروض خاصة'}),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button, fontSize: 14)))
            ]),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: reversedProducts.length,
                    itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: reversedProducts[index],
                        child: SingleProductMainPage())))
          ],
        ));
  }

  _buildGamesPlatformsHorizontalList(List<Product> products) {
    final gameProducts =
        products.where((prod) => prod.category == 'pubg').toList();
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(" منصات العاب",
                  style: TextStyle(color: AppColors.black, fontSize: 15)),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                          context, AppRoute.allProductsRoute, arguments: {
                        'title': ' منصات العاب',
                        // 'prodList': _controller.homePageGamesProductsList
                      }),
                  child: Text("رؤية الكل",
                      style: TextStyle(color: AppColors.button, fontSize: 14)))
            ]),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: gameProducts.length,
                    itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: gameProducts[index],
                        child: SingleProductMainPage())))
          ],
        ));
  }
}
