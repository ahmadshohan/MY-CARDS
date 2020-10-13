import 'package:flutter/cupertino.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  String _logo = 'assets/png/app_logo.png';
  FocusNode _phoneNumberFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      await _loginController.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
            builder: (_) => Stack(children: <Widget>[
                  SafeArea(
                    top: true,
                    bottom: true,
                    left: false,
                    right: false,
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          _buildLogo(),
                          SizedBox(height: 10),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Form(
                                      key: _formKey,
                                      autovalidate:
                                          _loginController.autoValidate,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ..._buildInputs(),
                                        ],
                                      )),
                                  SizedBox(height: 10),
                                  SizedBox(height: 20),
                                  _buildLoginButton(),
                                  SizedBox(height: 10),
                                  _buildForgotPassword(),
                                  _buildDontHaveAccount(),
                                ],
                              ))
                        ])),
                  ),
                  Visibility(
                      visible: _loginController.loading,
                      child: Center(child: Loader())),
                ])));
  }

  _buildLogo() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: Image.asset(
          _logo,
          fit: BoxFit.cover,
        ));
  }

  _buildInputs() {
    return [
      Center(
        child: Text(AppLocalization.login,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      SizedBox(height: 10),
      TextFormField(
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.phone,
          onChanged: (value) => _loginController.model.phoneNumber = value,
          validator: (_) => _loginController.checkPhoneNumber(),
          style: TextStyle(color: AppColors.black),
          textInputAction: TextInputAction.next,
          focusNode: _phoneNumberFocusNode,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              suffixIcon: Icon(EvaIcons.phone),
              fillColor: Colors.white10,
              filled: true,
              labelStyle: TextStyle(color: AppColors.black),
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
              ))),
      SizedBox(height: 10),
      Observer(
        builder: (_) => TextFormField(
            textDirection: TextDirection.rtl,
            style: TextStyle(color: AppColors.black),
            obscureText: !_loginController.showPassword,
            focusNode: _passwordFocusNode,
            onChanged: (value) => _loginController.model.password = value,
            validator: (_) => _loginController.checkPassword(),
            onFieldSubmitted: (_) => KeyBoard.close(context),
            decoration: InputDecoration(
                labelText: 'كلمة المرور',
                fillColor: Colors.white10,
                filled: true,
                labelStyle: TextStyle(color: AppColors.black),
                contentPadding: EdgeInsets.all(16),
                suffixIcon: GestureDetector(
                    onTap: () => _loginController.changeViewPassword(),
                    child: Icon(
                        _loginController.showPassword
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff,
                        color: AppColors.black)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
      ),
    ];
  }

  _buildLoginButton() {
    return SizedBox(
        height: 60,
        width: double.infinity,
        child: JRaisedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.mainRoute),
            // onPressed: () async {
            //   KeyBoard.close(context);
            //   if (_formKey.currentState.validate()) {
            //     // await _loginController.login(context);
            //     Navigator.of(context).pushReplacementNamed(AppRoute.mainRoute);
            //   } else
            //     _loginController.autoValidate = true;
            // },
            text: "دخول"));
  }

  _buildForgotPassword() {
    return GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(
            context, AppRoute.forgotPasswordRoute),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "نسيت كلمة المرور؟",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19)),
          TextSpan(
              text: "استعادة",
              style: TextStyle(
                color: AppColors.button,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ))
        ])));
  }

  _buildDontHaveAccount() {
    return GestureDetector(
        onTap: () =>
            Navigator.pushReplacementNamed(context, AppRoute.registerRoute),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "ليس لديك حساب؟",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19)),
          TextSpan(
              text: "حساب جديد ",
              style: TextStyle(
                color: AppColors.button,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ))
        ])));
  }
}
