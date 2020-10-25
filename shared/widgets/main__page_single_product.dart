import 'package:animations/animations.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductMainPage extends StatefulWidget {
  @override
  _SingleProductMainPageState createState() => _SingleProductMainPageState();
}

class _SingleProductMainPageState extends State<SingleProductMainPage> {
  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context);
    final product = Provider.of<Products>(context);
    return InkWell(
        onTap: () => Navigator.of(context).pushNamed(
            AppRoute.productDetailRoute,
            arguments: singleProduct.id),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            padding: const EdgeInsets.only(left: 10),
            child: Column(children: [
              Expanded(
                child: Image.asset(singleProduct.image,
                    width: MediaQuery.of(context).size.width * 0.35,
                    fit: BoxFit.cover),
              ),
              Text(singleProduct.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12))
            ])));
  }

  _showConfirmDialog(BuildContext context, Product loadedProduct) async {
    return await showModal(
        configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400)),
        context: context,
        builder: (ctx) => AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                title: Text('هل انت متأكد ؟',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.red)),
                content: Text('هل تريد ازالة هذا المنتج ؟',
                    overflow: TextOverflow.ellipsis),
                actions: <Widget>[
                  FlatButton(
                      color: Colors.black12,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text('نعم',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                  FlatButton(
                      color: Colors.black12,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text('لا',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )))
                ]));
  }
}
