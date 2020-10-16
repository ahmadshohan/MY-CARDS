import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:mycarts/shared/widgets/single_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).orders;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.1,
            backgroundColor: AppColors.button,
            centerTitle: true,
            title: Text('طلباتي',
                overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
        body: orderData.isEmpty
            ? Center(
                child: Text('لا يوجد طلبات !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    )))
            : Consumer<Orders>(
                builder: (ctx, orderData, child) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, i) => SingleOrder(orderData.orders[i]),
                  ),
                ),
              ));
  }
}
