import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/products.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleProductHorizental extends StatefulWidget {
  @override
  _SingleProductHorizentalState createState() =>
      _SingleProductHorizentalState();
}

class _SingleProductHorizentalState extends State<SingleProductHorizental> {
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context);
    final product = Provider.of<Products>(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.productDetailRoute,
          arguments: singleProduct.id),
      child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(singleProduct.image,
                            fit: BoxFit.contain))),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('حقيبة ظهر',
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF3C3C3C))),
                                  IconButton(
                                      icon: Icon(
                                          singleProduct.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: singleProduct.isFavorite
                                              ? Colors.red
                                              : Colors.black),
                                      onPressed: () =>
                                          singleProduct.toggleFavoriteStatus())
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                          "${singleProduct.currentPrice.toString()} دع",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.button))),
                                  Expanded(
                                      child: Text(
                                    " ${singleProduct.oldPrice.toString()}دع",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 9,
                                        decoration: TextDecoration.lineThrough),
                                  )),
                                  Expanded(
                                      child: SizedBox(
                                          height: 25,
                                          child: RaisedButton(
                                            child: Text("اشتري الآن",
                                                style: TextStyle(fontSize: 10)),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: AppColors.button,
                                            textColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            onPressed: () =>
                                                Navigator.pushNamed(
                                                    context,
                                                    AppRoute
                                                        .paymentMethodRoute),
                                          ))),
                                ]),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Icon(EvaIcons.star,
                                              color: Colors.amber),
                                          Icon(EvaIcons.star,
                                              color: Colors.amber),
                                          Icon(EvaIcons.star,
                                              color: Colors.amber),
                                          Icon(EvaIcons.star,
                                              color: Colors.amber),
                                          Icon(EvaIcons.star,
                                              color: Colors.amber)
                                        ],
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text('خصم %8',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.button)))
                                ]),
                          ]),
                    ))
              ])),
    );
  }
}
