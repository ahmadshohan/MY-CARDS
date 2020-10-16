import 'package:mycarts/colors.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/main/all_products/all_products_controller.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/products_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  AllProductsController _controller = AllProductsController();
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.productsList;
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final title = arguments['title'];
    return Scaffold(
        key: _key,
        appBar: AppBar(
            backgroundColor: AppColors.button,
            title: Text(title, overflow: TextOverflow.ellipsis),
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
        body: Observer(
          builder: (_) => Container(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: ProductsGrid(products))
                    ]),
              )),
        ));
  }
}
