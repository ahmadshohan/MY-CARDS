import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/payment/payment_detail/payment_detail_controller.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/toaster.dart';

class PaymentDetailPage extends StatefulWidget {
  @override
  _PaymentDetailPageState createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  PaymentDetailController _controller = PaymentDetailController();
  @override
  Widget build(BuildContext context) {
    // final paymentMethod = ModalRoute.of(context).settings.arguments as PaymentMethod;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.button,
          title: Text('الدفع', overflow: TextOverflow.ellipsis),
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25),
                              _paymentPlan(),
                              SizedBox(height: 30),
                              _buildInputs(),
                              SizedBox(height: 10),
                              _buildHelpText(),
                            ]),
                      ),
                    )),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _bottomPayButton(),
    );
  }

  _paymentPlan() {
    return Image.asset('assets/png/payment_detail.png',
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
                Text('اسم البنك',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    style: TextStyle(color: AppColors.black),
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.fullName = value,
                    // validator: (_) => _registerController.checkFullName(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 10),
                Text(' المدينة',
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
                Text(' المبلغ',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
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
                SizedBox(height: 5),
                Text(' ارفق صورة الوصل',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                TextFormField(
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.phoneNumber = value,
                    // validator: (_) => _registerController.checkPhoneNumber(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    decoration: InputDecoration(
                        fillColor: Colors.white10,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        prefixIcon: GestureDetector(
                            onTap: () => _buildMediaSelector(),
                            child: Icon(Icons.cloud_upload)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 5),
                Text('  ملاحظة',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.phoneNumber = value,
                    // validator: (_) => _registerController.checkPhoneNumber(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: 'اكتب ملاحظة',
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

  _bottomPayButton() {
    return Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: JRaisedButton(
            onPressed: () => Navigator.pushNamed(
                context, AppRoute.paymentCustomerInformationRoute),
            text: 'ادفع'));
  }

  _buildMediaSelector() {
    showModalBottomSheet<dynamic>(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: AppColors.BottomPanel,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.songItemCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: 80,
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  top: false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openCamera();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/camera.svg',
                                  color: AppColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.camera,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: AppColors.white))
                            ])),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openGallery();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/gallery.svg',
                                  color: AppColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.gallery,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: AppColors.white))
                            ]))
                      ]),
                )),
          );
        });
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

  _openCamera() {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 200)
        .then((picture) {
      // _setFile(isIdNumber, picture);
    }).catchError((e) {
      Toaster.warning(AppLocalization.openCameraPermission);
    });
  }

  _openGallery() async {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 200)
        .then((picture) {
      // _setFile(isIdNumber, picture);
    }).catchError((e) {
      Toaster.warning(AppLocalization.openGalleryPermission);
    });
  }
}
