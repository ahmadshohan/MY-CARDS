import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/products.dart';
import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductCart extends StatefulWidget {
  final String cartId, productId, title, size, image;
  int currentPrice, oldPrice, quantity;
  bool isFavorite;

  SingleProductCart(
      {this.cartId,
      this.productId,
      this.title,
      this.size,
      this.image,
      this.currentPrice,
      this.oldPrice,
      this.isFavorite,
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
      onDismissed: (direction) {
        Provider.of<Products>(context, listen: false)
            .removeItem(widget.productId);
      },
      confirmDismiss: (direction) {
        return _showConfirmDialog(context);
      },
      background: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(
            right: 20,
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          )),
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
                        child: Image.asset(widget.image, fit: BoxFit.contain))),
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
                                  Icon(
                                      widget.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: widget.isFavorite
                                          ? Colors.red
                                          : Colors.black),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                          "${widget.currentPrice.toString()} دع",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.button))),
                                  Expanded(
                                      child: Text(
                                    " ${widget.oldPrice.toString()}دع",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 9,
                                        decoration: TextDecoration.lineThrough),
                                  )),
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

  _showConfirmDialog(BuildContext context) {
    return showModal(
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
                          .removeItem(widget.productId);
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
