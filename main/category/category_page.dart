import 'package:mycarts/colors.dart';
import 'package:mycarts/main/category/category_controller.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/products_grid.dart';
import 'package:mycarts/shared/widgets/products_list.dart';
import 'package:mycarts/shared/widgets/app_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryController _controller = CategoryController();
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
    return Scaffold(
        appBar: AppSearchBar.buildFullAppBar(context),
        body: Observer(
          builder: (_) => Container(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: [
                        Text("احدث العروض",
                            style: TextStyle(
                                color: AppColors.button, fontSize: 19)),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.apps,
                              color: _controller.showList
                                  ? Colors.grey
                                  : AppColors.button),
                          onPressed: () => _controller.changeView(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: _controller.showList
                                ? AppColors.button
                                : Colors.grey,
                          ),
                          onPressed: () => _controller.changeView(),
                        )
                      ]),
                      Expanded(
                          child: _controller.showList
                              ? ProductsList(products)
                              : ProductsGrid(products))
                    ]),
              )),
        ));
  }
}
