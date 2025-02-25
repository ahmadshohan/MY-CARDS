import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/products.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context);
    final product = Provider.of<Products>(context);
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoute.productDetailRoute,
            arguments: singleProduct.id),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                child: Image.asset(singleProduct.image,
                                    fit: BoxFit.cover)))
                      ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(children: [
                          Text('رصيد المنتج', overflow: TextOverflow.ellipsis),
                          SizedBox(width: 10),
                          Text('16', overflow: TextOverflow.ellipsis)
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              product.addCart(
                                                productId: singleProduct.id,
                                                title: singleProduct.name,
                                                currentPrice:
                                                    singleProduct.currentPrice,
                                                oldPrice:
                                                    singleProduct.oldPrice,
                                                isFavorite:
                                                    singleProduct.isFavorite,
                                                isWish: singleProduct.isWish,
                                                image: singleProduct.image,
                                              );
                                              Scaffold.of(context)
                                                  .hideCurrentSnackBar();
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'تم اضافة المنتج الى السلة ',
                                                          style: TextStyle(
                                                              fontSize: 17)),
                                                      duration:
                                                          Duration(seconds: 3),
                                                      elevation: 3,
                                                      action: SnackBarAction(
                                                        label: 'تراجع',
                                                        onPressed: () {
                                                          product
                                                              .removeSingleItem(
                                                            singleProduct.id,
                                                          );
                                                        },
                                                      )));
                                            },
                                            child: Icon(Icons.add_shopping_cart,
                                                color: AppColors.button)),
                                        InkWell(
                                          onTap: () =>
                                              singleProduct.changeWishStatus(),
                                          child: Image.asset(
                                            'assets/png/dream-catcher.png',
                                            height: 30,
                                            width: 30,
                                            color: singleProduct.isWish
                                                ? Colors.deepOrange
                                                : AppColors.button,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () => singleProduct
                                                .changeFavoriteStatus(),
                                            child: Icon(
                                              singleProduct.isFavorite
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              color: singleProduct.isFavorite
                                                  ? Colors.deepOrange
                                                  : AppColors.button,
                                            ))
                                      ])),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      "${singleProduct.currentPrice.toString()} دل",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.button)))
                            ])
                      ]))
                ])));
  }
}
