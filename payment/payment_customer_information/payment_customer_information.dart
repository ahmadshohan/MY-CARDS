import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/payment/payment_customer_information/payment_customer_information_controller.dart';
import 'package:mycarts/product/product_detail/product_detail_controller.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';

class PaymentCustomerInformationPage extends StatefulWidget {
  @override
  _PaymentCustomerInformationPageState createState() =>
      _PaymentCustomerInformationPageState();
}

class _PaymentCustomerInformationPageState
    extends State<PaymentCustomerInformationPage> {
  PaymentCustomerInformationController _controller =
      PaymentCustomerInformationController();
  ProductDetailController _productDetailController = ProductDetailController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.button,
          title: Text('تم الدفع', overflow: TextOverflow.ellipsis),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: AppColors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.white),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, AppRoute.shoppingCartRoute))
          ]),
      body: Observer(
          builder: (_) => Stack(children: [
                SafeArea(
                    top: true,
                    bottom: true,
                    left: false,
                    right: false,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 22),
                                  _paymentPlan(),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23),
                                  _buildImage(),
                                ])))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _buildDoneButton(),
    );
  }

  _paymentPlan() {
    return Image.asset('assets/png/payment_c_done.png',
        fit: BoxFit.cover, width: double.infinity);
  }

  _buildImage() {
    return Center(
      child: Column(children: [
        Text(' لقد اتممت عملية الدفع بنجاح',
            style: TextStyle(color: Colors.black, fontSize: 19)),
        Image.asset(
          'assets/png/payment_done.png',
          fit: BoxFit.cover,
        ),
      ]),
    );
  }

  _buildDoneButton() {
    return Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: JRaisedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoute.ordersRoute),
            text: 'تم'));
  }
}
