import 'dart:math';

import 'package:flutter/foundation.dart';
import 'cart_item.dart';

class OrderItem {
  final String id;
  final int amount, quantity;
  final DateTime dateTime;
  final List<CartItem> products;
  OrderItem(
      {@required this.id,
      this.quantity,
      @required this.amount,
      @required this.dateTime,
      @required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  // Future<void> fetchAndSetOrders() async {
  //   final List<OrderItem> loadedOrder = [];
  //   QuerySnapshot response = await fireStore
  //       .collection('orders')
  //       .where('id', isEqualTo: _user.uid)
  //       .get();
  //   List<DocumentSnapshot> allDocuments = response.docs;
  //   if (allDocuments == null) {
  //     return;
  //   } else {
  //     allDocuments.forEach((document) {
  //       var documentData = document.data();
  //       loadedOrder.add(
  //         OrderItem(
  //           id: _user.uid,
  //           amount: documentData['total'],
  //           dateTime: DateTime.parse(documentData['dateTime']),
  //           products: (documentData['products'] as List<dynamic>)
  //               .map(
  //                 (item) => CartItem(
  //                     id: item['id'],
  //                     title: item['title'],
  //                     size: item['size'],
  //                     color: item['color'],
  //                     image: item['image'],
  //                     price: item['price'],
  //                     quantity: item['quantity']),
  //               )
  //               .toList(),
  //         ),
  //       );
  //     });
  //
  //     _orders = loadedOrder.reversed.toList();
  //     notifyListeners();
  //   }
  // }

  Future<void> addOrder(List<CartItem> productsCart, int total) async {
    // User _user = firebaseAuth.currentUser;
    // if (_user != null) {
    final timestamp = DateTime.now();
    //   await fireStore.collection('orders').doc().set({
    //     'id': _user.uid,
    //     'total': total,
    //     'dateTime': timestamp.toIso8601String(),
    //     'products': productsCart
    //         .map((cp) => {
    //               'id': cp.id,
    //               'title': cp.title,
    //               'size': cp.size,
    //               'color': cp.color,
    //               'image': cp.image,
    //               'price': cp.price,
    //               'quantity': cp.quantity
    //             })
    //         .toList()
    //   });
    _orders.insert(
        0,
        OrderItem(
            id: timestamp.toString(),
            amount: total,
            dateTime: timestamp,
            products: productsCart));
    notifyListeners();
  }
}
