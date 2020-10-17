import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/app_drawer.dart';
import 'package:mycarts/shared/widgets/products_list.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/app_route.dart';

class WishesPage extends StatefulWidget {
  @override
  _WishesPageState createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).wishesProducts;
    return Scaffold(
        key: _key,
        appBar: AppBar(
            backgroundColor: AppColors.button,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(EvaIcons.menu, color: AppColors.white),
                onPressed: () => _key.currentState.openDrawer()),
            title: Text('الأمنيات', overflow: TextOverflow.ellipsis),
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
                      child: Text('لايوجد امنيات بعد !',
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
