import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:mycarts/shared/widgets/app_drawer.dart';
import 'package:mycarts/shared/widgets/single_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).orders;
    return Scaffold(
        key: _key,
        appBar: AppBar(
            elevation: 0.1,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.button,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(EvaIcons.menu, color: AppColors.white),
                onPressed: () => _key.currentState.openDrawer()),
            title: Text('طلباتي',
                overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
            actions: [
              IconButton(
                  icon: Icon(Icons.home, color: AppColors.white),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoute.mainRoute))
            ]),
        drawer: AppDrawer(),
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
