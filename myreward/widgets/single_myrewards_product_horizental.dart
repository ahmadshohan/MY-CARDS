import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleMyRrewardProductHorizental extends StatefulWidget {
  @override
  _SingleMyRrewardProductHorizentalState createState() =>
      _SingleMyRrewardProductHorizentalState();
}

class _SingleMyRrewardProductHorizentalState
    extends State<SingleMyRrewardProductHorizental> {
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context);
    final product = Provider.of<Products>(context);
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoute.productDetailRoute,
            arguments: singleProduct.id),
        child: Card(
            child: Column(children: [
          Container(
              height: 30,
              width: double.infinity,
              color: AppColors.button,
              padding: const EdgeInsets.only(right: 30),
              child: Text('خصم 5% لأكثر من خمس بطاقات',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.white))),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              singleProduct.image,
                              fit: BoxFit.cover,
                              height: 100,
                            ))),
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' بطاقة جوجل بلاي-متجر امريكي',
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF3C3C3C))),
                                  Row(children: [
                                    Expanded(
                                        child: Text(
                                            "${singleProduct.currentPrice.toString()} نقطة",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.black))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: SizedBox(
                                            height: 30,
                                            child: RaisedButton(
                                                child: Text("اطلبها الآن",
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                color: AppColors.button,
                                                textColor: AppColors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                onPressed: () {}))),
                                  ])
                                ])))
                  ])),
          Text(' ستحصل على 11 نقطة مكافئة عند شراء المنتج',
              style: TextStyle(fontSize: 15, color: AppColors.black))
        ])));
  }
}
