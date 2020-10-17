import 'package:flutter/material.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/shared/widgets/app_drawer.dart';
import 'file:///C:/Users/ASUS/Desktop/mycarts/mycarts/lib/myreward/widgets/single_myrewards_product_horizental.dart';
import 'package:mycarts/provider/products.dart';

class MyRewardsPage extends StatefulWidget {
  @override
  _MyRewardsPageState createState() => _MyRewardsPageState();
}

class _MyRewardsPageState extends State<MyRewardsPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final _searchController = TextEditingController();

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
          title: Text('مكافأتي', overflow: TextOverflow.ellipsis),
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
      body: productsData.isEmpty
          ? Center(
              child: Text('لايوجد مكافأت بعد !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontWeight: FontWeight.w200,
                  )))
          : _myRewardsProductsList(productsData),
    );
  }

  _myRewardsProductsList(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: SingleMyRrewardProductHorizental())),
    );
  }
}
