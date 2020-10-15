import 'package:mycarts/payment/payment_customer_information/payment_customer_information_controller.dart';
import 'package:mycarts/product/product_detail/product_detail_controller.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/j_outline_button.dart';
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
          backgroundColor: AppColors.button,
          title: Text('تم الدفع', overflow: TextOverflow.ellipsis),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: AppColors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.white),
                onPressed: () {}),
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
                                  SizedBox(height: 30),
                                  _buildInputs(),
                                ])))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _bottomNextPreviousButtons(),
    );
  }

  _paymentPlan() {
    return Image.asset('assets/png/payment_c_information.png',
        fit: BoxFit.cover, width: double.infinity);
  }

  _buildInputs() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('الاسم',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    style: TextStyle(color: AppColors.black),
                    // onChanged: (value) =>
                    //     _registerController.model.fullName = value,
                    // validator: (_) => _registerController.checkFullName(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    decoration: InputDecoration(
                        suffixIcon: Icon(EvaIcons.person, color: Colors.grey),
                        fillColor: AppColors.white,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 10),
                Text('العنوان ',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.email = value,
                    // validator: (_) => _registerController.checkEmail(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    style: TextStyle(color: AppColors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white10,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 10),
                Text('المحافظة',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.phoneNumber = value,
                    // validator: (_) => _registerController.checkPhoneNumber(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        fillColor: Colors.white10,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 10),
                Text('ملاحظة',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      KeyBoard.close(context);
                    },
                    maxLines: 6,
                    style: TextStyle(color: AppColors.black),
                    decoration: InputDecoration(
                        hintText: "اكتب ملاحظة .......",
                        fillColor: Colors.white10,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
              ]),
        ]);
  }

  _bottomNextPreviousButtons() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white30,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Divider(),
          Row(children: <Widget>[
            Expanded(
                child: JOutlineButton(
                    color: AppColors.button,
                    onPressed: () {
                      KeyBoard.close(context);
                      Navigator.pop(context);
                    },
                    text: 'السابق')),
            SizedBox(width: 15),
            Expanded(
                child: JRaisedButton(
                    onPressed: () =>
                        _productDetailController.handleBuyNow(context),
                    text: 'ادفع')),
          ])
        ]));
  }
}
