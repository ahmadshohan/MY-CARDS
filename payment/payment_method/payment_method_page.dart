import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/payment/payment_method/payment_method_controller.dart';
import 'package:mycarts/shared/constant/payment_method.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:mycarts/colors.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  PaymentMethodController _controller = PaymentMethodController();
  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.button,
          elevation: 0.1,
          title: Text('طريقة الدفع', overflow: TextOverflow.ellipsis),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: AppColors.white),
                onPressed: () {
                  showSearch(context: context, delegate: AppSearch());
                }),
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
                                  SizedBox(height: 10),
                                  _paymentPlan(),
                                  SizedBox(height: 5),
                                  _buildLocalBank(),
                                  _buildCash(),
                                  _buildAdvanceCard(),
                                  SizedBox(height: 20),
                                  _buildHelpText()
                                ])))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _buildNextButton(),
    );
  }

  _paymentPlan() {
    return Image.asset('assets/png/payment_method.png',
        fit: BoxFit.cover, width: double.infinity);
  }

  _buildLocalBank() {
    return Observer(
        builder: (_) => Card(
            elevation: 5,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: Center(
                    child: Theme(
                        data: ThemeData(unselectedWidgetColor: AppColors.black),
                        child: RadioListTile(
                            value: PaymentMethod.LocalBank,
                            groupValue: _controller.selectedPaymentMethod,
                            title: ListTile(
                                title: Row(children: [
                                  Icon(Icons.satellite, color: AppColors.black),
                                  Text(' الدفع المصرفي',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19))
                                ]),
                                subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'من خلال احد المصارف المحلية الليبية',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15)),
                                      Text(
                                          'ملاحظة:تحتسب رسوم اضافية وقدرها 25% على اجمالي المبلغ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13))
                                    ])),
                            activeColor: AppColors.button,
                            onChanged: (newValue) {
                              _controller
                                  .setSelectedPaymentMethodType(newValue);
                            }))))));
  }

  _buildCash() {
    return Observer(
      builder: (_) => Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: Center(
              child: Theme(
                  data: ThemeData(unselectedWidgetColor: AppColors.black),
                  child: RadioListTile(
                      value: PaymentMethod.Cash,
                      groupValue: _controller.selectedPaymentMethod,
                      title: ListTile(
                        title: Row(children: [
                          Icon(EvaIcons.creditCard, color: AppColors.black),
                          Text(' كاش',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19))
                        ]),
                        subtitle: Text('من خلال احد الموزعين المعتمدين',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ),
                      activeColor: AppColors.button,
                      onChanged: (newValue) {
                        _controller.setSelectedPaymentMethodType(newValue);
                      })),
            ),
          )),
    );
  }

  _buildAdvanceCard() {
    return Observer(
      builder: (_) => Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: Center(
              child: Theme(
                  data: ThemeData(unselectedWidgetColor: AppColors.black),
                  child: RadioListTile(
                      value: PaymentMethod.AdvanceCard,
                      groupValue: _controller.selectedPaymentMethod,
                      title: ListTile(
                        title: Row(children: [
                          Icon(Icons.credit_card, color: AppColors.black),
                          Text(' بطاقة مسبقة',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19))
                        ]),
                        subtitle: Text('من خلال بطاقات ليبيا الرقمية',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ),
                      activeColor: AppColors.button,
                      onChanged: (newValue) {
                        _controller.setSelectedPaymentMethodType(newValue);
                      })),
            ),
          )),
    );
  }

  _buildHelpText() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.messageusRoute),
      child: Center(
        child: Text(
          'هل تريد الحصول على مساعدة ؟اضغط هنا',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.button),
        ),
      ),
    );
  }

  _buildNextButton() {
    return Container(
        height: 60,
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        width: double.infinity,
        child: JRaisedButton(
            onPressed: () {
              if (_controller.selectedPaymentMethod == PaymentMethod.Cash)
                Navigator.pushNamed(
                    context, AppRoute.paymentCustomerInformationRoute);
              else
                Navigator.pushNamed(context, AppRoute.paymentDetailRoute);
            },
            text: 'التالي'));
  }
}
