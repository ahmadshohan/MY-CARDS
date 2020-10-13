import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/products_grid.dart';
import 'package:mycarts/shared/widgets/app_search_bar.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).favoritesProducts;
    return Scaffold(
        appBar: AppSearchBar.buildFullAppBar(context),
        body: Container(
            height: double.infinity,
            padding: EdgeInsets.all(10),
            child: SafeArea(
              top: true,
              bottom: true,
              left: false,
              right: false,
              child: productsData.isEmpty
                  ? Center(
                      child: Text('',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                            fontWeight: FontWeight.w200,
                          )))
                  : ProductsGrid(productsData),
            )));
  }
}
