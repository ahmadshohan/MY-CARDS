import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/provider/products.dart';
import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class SingleProductCart extends StatefulWidget {
  final String cartId, productId, title, size, image;
  int currentPrice, oldPrice, quantity;
  bool isFavorite;
  bool isWish;

  SingleProductCart(
      {this.cartId,
      this.productId,
      this.title,
      this.size,
      this.image,
      this.currentPrice,
      this.oldPrice,
      this.isFavorite,
      this.isWish,
      this.quantity});

  @override
  _SingleProductCartState createState() => _SingleProductCartState();
}

class _SingleProductCartState extends State<SingleProductCart> {
  bool isInit = true;
  var cart;
  var cartItems;
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      cart = Provider.of<Products>(
        context,
      );
      cartItems = cart.cartItems;
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(widget.cartId),
        direction: DismissDirection.startToEnd,
        // onDismissed: (direction) {
        //   Provider.of<Products>(context, listen: false)
        //       .removeItem(widget.productId);
        // },
        confirmDismiss: (direction) async {
          return await _showConfirmDialog(context);
        },
        background: Container(
            decoration: BoxDecoration(
                color: AppColors.button,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Icon(Icons.delete, color: Colors.white, size: 40)),
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
                            child: Image.asset(widget.image,
                                fit: BoxFit.cover, height: 100))),
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
                                            "${widget.currentPrice.toString()} دل",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.black))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Row(children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(Icons.add_shopping_cart,
                                              size: 35)),
                                      Icon(
                                          widget.isWish
                                              ? EvaIcons.gift
                                              : EvaIcons.giftOutline,
                                          color: widget.isWish
                                              ? Colors.red
                                              : Colors.black,
                                          size: 35),
                                      InkWell(
                                          onTap: () async {
                                            return await _showConfirmDialog(
                                                context);
                                          },
                                          child: Icon(EvaIcons.closeCircle,
                                              size: 35,
                                              color: AppColors.button))
                                    ]))
                                  ])
                                ])))
                  ])),
          Text(' ستحصل على 11 نقطة مكافئة عند شراء المنتج',
              style: TextStyle(fontSize: 15, color: AppColors.black))
        ])));
  }

  _showConfirmDialog(BuildContext context) async {
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
              content: Text('هل تريد ازالة هذا المنتج من السلة ؟',
                  overflow: TextOverflow.ellipsis),
              actions: <Widget>[
                FlatButton(
                    color: Colors.black12,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Provider.of<Products>(context, listen: false)
                          .removeCartItem(widget.productId);
                      Navigator.of(ctx).pop();
                    },
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
              ],
            ));
  }
}
