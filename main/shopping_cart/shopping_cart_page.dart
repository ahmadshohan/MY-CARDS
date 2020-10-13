import 'package:mycarts/shared/widgets/app_search_bar.dart';
import 'package:mycarts/shared/widgets/single_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/shopping_cart/shopping_cart_controller.dart';
import 'package:mycarts/provider/cart_item.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  ShoppingCartController _controller = ShoppingCartController();
  final _searchController = TextEditingController();
  bool isInit = true;
  Products cart;
  Map<String, CartItem> cartItems;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      cart = Provider.of<Products>(context);
      cartItems = cart.cartItems;
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppSearchBar.buildFullAppBar(context),
        body: cartItems.isEmpty || cart.totalAmount == 0
            ? Center(
                child: Text('لايوجد منتجات في السلة بعد !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                        fontWeight: FontWeight.w200)))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: cart.cartItems.length,
                            itemBuilder: (ctx, index) => SingleProductCart(
                                  cartId:
                                      cart.cartItems.values.toList()[index].id,
                                  productId:
                                      cart.cartItems.keys.toList()[index],
                                  title: cart.cartItems.values
                                      .toList()[index]
                                      .title,
                                  size: cart.cartItems.values
                                      .toList()[index]
                                      .size,
                                  image: cart.cartItems.values
                                      .toList()[index]
                                      .image,
                                  currentPrice: cart.cartItems.values
                                      .toList()[index]
                                      .currentPrice,
                                  oldPrice: cart.cartItems.values
                                      .toList()[index]
                                      .oldPrice,
                                  isFavorite: cart.cartItems.values
                                      .toList()[index]
                                      .isFavorite,
                                  quantity: cart.cartItems.values
                                      .toList()[index]
                                      .quantity,
                                ))),
                    cartItems.isEmpty || cart.totalAmount == 0
                        ? Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(
                              right: 18,
                              bottom: 15,
                            ),
                            child: FloatingActionButton(
                              child: Icon(Icons.add, size: 30),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoute.mainRoute);
                              },
                            ))
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.white30,
                            child: Row(children: <Widget>[
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(children: <Widget>[
                                        Text('المجموع النهائي',
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold)),
                                        Chip(
                                            label: RichText(
                                                text: TextSpan(children: [
                                          TextSpan(
                                              text: '${cart.totalAmount} دع',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                              ))
                                        ])))
                                      ]))),
                              Expanded(
                                child: SizedBox(
                                    height: 50,
                                    child: RaisedButton(
                                      child: Text("ادفع الأن",
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
                                    )),
                              )
                            ]))
                  ],
                )));
  }
}
