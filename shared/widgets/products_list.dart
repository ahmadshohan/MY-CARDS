import 'package:flutter/material.dart';
import 'package:mycarts/shared/widgets/single_product_horizental.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  ProductsList(this.products);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index], child: SingleProductHorizental())),
    );
  }
}
