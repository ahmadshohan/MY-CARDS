import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderTrackPage extends StatefulWidget {
  @override
  _OrderTrackPageState createState() => _OrderTrackPageState();
}

class _OrderTrackPageState extends State<OrderTrackPage> {
  int a = 1;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final orderData = ModalRoute.of(context).settings.arguments as OrderItem;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.1,
            backgroundColor: AppColors.button,
            centerTitle: true,
            title: Text(' تتبع الطلب${orderData.id}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13)),
            actions: [
              IconButton(
                  icon: Icon(Icons.home, color: AppColors.white),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoute.mainRoute))
            ]),
        body: Container(
            height: double.infinity,
            padding: EdgeInsets.all(10),
            child: SafeArea(
              top: true,
              bottom: true,
              left: false,
              right: false,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  Padding(
                      padding: EdgeInsetsDirectional.only(end: 20.0),
                      child: Column(children: <Widget>[
                        Container(height: height * 0.08),

                        ///first Status of order
                        Text(DateFormat('dd/MM').format(orderData.dateTime)),
                        Text(DateFormat('hh:mm').format(orderData.dateTime)),
                        Container(height: height * 0.08),

                        ///second  Status of order
                        Text(DateFormat('dd/MM').format(orderData.dateTime)),
                        Text(DateFormat('hh:mm').format(orderData.dateTime)),
                        Container(height: height * 0.08),

                        ///third Status of order
                        Text(DateFormat('dd/MM').format(orderData.dateTime)),
                        Text(DateFormat('hh:mm').format(orderData.dateTime)),

                        Container(height: height * 0.08),

                        ///fourth Status of order
                        Text(DateFormat('dd/MM').format(orderData.dateTime)),
                        Text(DateFormat('hh:mm').format(orderData.dateTime)),

                        Container(height: height * 0.08),

                        ///fifth Status of order
                        Text(DateFormat('dd/MM').format(orderData.dateTime)),
                        Text(DateFormat('hh:mm').format(orderData.dateTime))
                      ])),
                  Column(children: <Widget>[
                    Container(
                        width: 5,
                        height: height * 0.1,

                        ///check first Status of order
                        color: a == 1 ? Colors.red : Colors.blue),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(

                            ///check first Status of order
                            color: a == 1 ? Colors.red : Colors.blue,
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () {
                            print('Go To Home page');
                          },
                        )),
                    Container(
                        width: 5,
                        height: height * 0.1,

                        ///check Second Status of order
                        color: b == 1 ? Colors.red : Colors.blue),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          ///check Second Status of order
                          color: b == 1 ? Colors.red : Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.autorenew,
                            color: Colors.white, size: 20.0)),
                    Container(
                      width: 5,
                      height: height * 0.1,

                      ///check third Status of order
                      color: c == 1 ? Colors.red : Colors.blue,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        ///check third Status of order
                        color: c == 1 ? Colors.red : Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.receipt,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    Container(
                        width: 5,
                        height: height * 0.1,

                        ///check Fourth Status of order
                        color: d == 1 ? Colors.red : Colors.blue),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        ///check fourth Status of order
                        color: d == 1 ? Colors.red : Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.local_shipping,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Container(
                        width: 5,
                        height: height * 0.1,

                        ///check fifth Status of order
                        color: e == 1 ? Colors.red : Colors.blue),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        ///check fifth Status of order
                        color: e == 1 ? Colors.red : Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    )
                  ]),
                  Padding(
                      padding: EdgeInsetsDirectional.only(top: 50, start: 40.0),
                      child: Column(children: <Widget>[
                        Container(height: height * 0.02),

                        ///first Status of order
                        Text('الطلب',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),
                        Container(height: height * 0.1),

                        ///second  Status of order
                        Text('الدفع',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),
                        Container(height: height * 0.11),

                        ///third Status of order
                        Text('عملية التعبئة',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),

                        Container(height: height * 0.1),

                        ///fourth Status of order
                        Text('الشحن',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),

                        Container(height: height * 0.1),

                        ///fifth Status of order
                        Text('تم التسليم',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600))
                      ]))
                ])
              ]),
            )));
  }
}
