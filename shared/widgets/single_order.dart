import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleOrder extends StatefulWidget {
  final OrderItem order;
  SingleOrder(this.order);

  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.orderTrackRoute,
          arguments: widget.order),
      child: Card(
          elevation: 5,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.center,
              child: ListTile(
                  title: Text('orderId',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(DateFormat('dd/MM/yyyy/ hh:mm')
                      .format(widget.order.dateTime)),
                  trailing: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Container(
                        child: Text("قيد التنفيذ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, color: AppColors.white)),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColors.button,
                            borderRadius: BorderRadius.circular(10)),
                      ))))),
    );
  }
}
