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
        child: Container(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Card(
                                  elevation: 5,
                                  color: AppColors.cardItemBg,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: IconButton(
                                                    icon: Icon(
                                                        singleProduct.isFavorite
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        color: singleProduct
                                                                .isFavorite
                                                            ? Colors.red
                                                            : Colors.black),
                                                    onPressed: () => singleProduct
                                                        .toggleFavoriteStatus()),
                                              ),
                                              Expanded(
                                                  child: Row(children: [
                                                Icon(EvaIcons.star,
                                                    size: 13,
                                                    color: Colors.amber),
                                                Icon(EvaIcons.star,
                                                    size: 13,
                                                    color: Colors.amber),
                                                Icon(EvaIcons.star,
                                                    size: 13,
                                                    color: Colors.amber),
                                                Icon(EvaIcons.star,
                                                    size: 13,
                                                    color: Colors.amber),
                                                Icon(EvaIcons.star,
                                                    size: 13,
                                                    color: Colors.amber)
                                              ]))
                                            ]),
                                        Expanded(
                                            child: Row(children: [
                                          Expanded(
                                              child: Image.asset(
                                            singleProduct.image,
                                            fit: BoxFit.contain,
                                          ))
                                        ]))
                                      ]))),
                          Text('حقيبة ظهر'),
                          Row(children: [
                            Expanded(
                                child: Text(
                                    "${singleProduct.currentPrice.toString()} دع",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.button))),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text(
                                    " ${singleProduct.oldPrice.toString()}دع",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 9,
                                        decoration:
                                            TextDecoration.lineThrough)))
                          ]),
                          Row(children: [
                            Expanded(
                                child: SizedBox(
                                    height: 30,
                                    child: RaisedButton(
                                      child: Text("اشتري الآن",
                                          style: TextStyle(fontSize: 13)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      onPressed: () => Navigator.pushNamed(
                                          context, AppRoute.paymentMethodRoute),
                                    ))),
                            SizedBox(width: 20),
                            Expanded(
                                child: Text('خصم %8',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.button)))
                          ])
                        ])))));
  }
}
