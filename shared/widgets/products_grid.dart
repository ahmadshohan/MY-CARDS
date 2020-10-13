import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/single_product_vertical.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  ProductsGrid(this.products);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
            childAspectRatio: 1 / 1.3),
        // padding: EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 5),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: products[index], child: SingleProductVertical());
        });
  }
}
