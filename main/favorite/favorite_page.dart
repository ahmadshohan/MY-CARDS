import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/widgets/app_drawer.dart';
import 'package:mycarts/shared/widgets/products_list.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).favoritesProducts;
    return Scaffold(
        key: _key,
        appBar: AppBar(
            backgroundColor: AppColors.button,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(EvaIcons.menu, color: AppColors.white),
                onPressed: () => _key.currentState.openDrawer()),
            title: Text('المفضلة', overflow: TextOverflow.ellipsis),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.search, color: AppColors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: AppColors.white),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoute.shoppingCartRoute))
            ]),
        drawer: AppDrawer(),
        body: Container(
            height: double.infinity,
            child: SafeArea(
              top: true,
              bottom: true,
              left: false,
              right: false,
              child: productsData.isEmpty
                  ? Center(
                      child: Text('لايوجد مفضلة بعد !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                            fontWeight: FontWeight.w200,
                          )))
                  : ProductsList(productsData),
            )));
  }
}
