import 'package:animations/animations.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/products.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
                                            "${singleProduct.currentPrice.toString()} دل",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.black))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Row(children: [
                                      InkWell(
                                          onTap: () {
                                            product.addCart(
                                              productId: singleProduct.id,
                                              title: singleProduct.name,
                                              currentPrice:
                                                  singleProduct.currentPrice,
                                              oldPrice: singleProduct.oldPrice,
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
                                          child: Icon(Icons.add_shopping_cart)),
                                      InkWell(
                                        onTap: () =>
                                            singleProduct.changeWishStatus(),
                                        child: Icon(
                                            singleProduct.isWish
                                                ? EvaIcons.gift
                                                : EvaIcons.giftOutline,
                                            color: singleProduct.isWish
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            EvaIcons.closeCircle,
                                            size: 30,
                                            color: AppColors.button,
                                          ))
                                    ]))
                                  ])
                                ])))
                  ])),
          Text(' ستحصل على 11 نقطة مكافئة عند شراء المنتج',
              style: TextStyle(fontSize: 15, color: AppColors.black))
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
