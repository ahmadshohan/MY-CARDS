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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Expanded(
                  child: Row(children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.asset(singleProduct.image,
                            fit: BoxFit.cover)))
              ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(children: [
                    Row(children: [
                      Text('رصيد المنتج', overflow: TextOverflow.ellipsis),
                      SizedBox(width: 10),
                      Text('16', overflow: TextOverflow.ellipsis)
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(
                          flex: 2,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            InkWell(
                                onTap: () {},
                                child: Icon(Icons.add_shopping_cart)),
                            InkWell(
                                onTap: () => singleProduct.changeWishStatus(),
                                child: Icon(
                                    singleProduct.isWish
                                        ? EvaIcons.gift
                                        : EvaIcons.giftOutline,
                                    color: singleProduct.isWish
                                        ? Colors.red
                                        : Colors.black)),
                            InkWell(
                                onTap: () =>
                                    singleProduct.changeFavoriteStatus(),
                                child: Icon(
                                    singleProduct.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: singleProduct.isFavorite
                                        ? Colors.red
                                        : Colors.black))
                          ])),
                      Expanded(
                          flex: 1,
                          child: Text(
                              "${singleProduct.currentPrice.toString()} دل",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.button)))
                    ])
                  ]))
            ])));
  }
}
