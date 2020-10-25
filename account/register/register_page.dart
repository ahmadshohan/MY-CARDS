import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycarts/account/register/register_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/constant/data_list.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _logo = 'assets/png/app_logo.png';
  RegisterController _registerController = RegisterController();
  FocusNode _nameFN = FocusNode();
  FocusNode _telefonNumberFN = FocusNode();
  FocusNode _emailFN = FocusNode();
  FocusNode _passwordFN = FocusNode();
  FocusNode _passwordConfirmFN = FocusNode();
  FocusNode _birthFN = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _passwordConfirmFN.dispose();
    _birthFN.dispose();
    _emailFN.dispose();
    _nameFN.dispose();
    _passwordFN.dispose();
    _telefonNumberFN.dispose();
  }

  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      await _registerController.init();
    });
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
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Form(
                                        key: _formKey,
                                        autovalidate:
                                            _registerController.autoValidate,
                                        child: _buildInputs(),
                                      ),
                                      SizedBox(height: 20),
                                      _buildRegisterButton(),
                                      SizedBox(height: 10),
                                      _buildHaveAccount()
                                    ])),
                          ]))),
                  Visibility(
                      visible: _registerController.loading,
                      child: Center(child: Loader()))
                ])));
  }

  _buildLogo() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
        child: Image.asset(
          _logo,
          fit: BoxFit.cover,
        ));
  }

  _buildInputs() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(AppLocalization.register,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                    TextFormField(
                        style: TextStyle(color: AppColors.black),
                        focusNode: _nameFN,
                        onChanged: (value) =>
                            _registerController.model.fullName = value,
                        validator: (_) => _registerController.checkFullName(),
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_emailFN),
                        decoration: InputDecoration(
                            labelText: AppLocalization.name,
                            suffixIcon:
                                Icon(EvaIcons.person, color: Colors.grey),
                            fillColor: AppColors.white,
                            filled: true,
                            labelStyle: TextStyle(color: AppColors.black),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10),
                            ))),
                    SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) =>
                            _registerController.model.email = value,
                        validator: (_) => _registerController.checkEmail(),
                        focusNode: _emailFN,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(_telefonNumberFN),
                        style: TextStyle(color: AppColors.black),
                        decoration: InputDecoration(
                            labelText: AppLocalization.email,
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon:
                                Icon(EvaIcons.email, color: Colors.grey),
                            labelStyle: TextStyle(color: AppColors.black),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10),
                            ))),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(children: [
                              Expanded(
                                  child: CountryCodePicker(
                                      initialSelection: 'LY',
                                      favorite: ['+963', 'SY', '+39', 'FR'],
                                      onChanged:
                                          _registerController.onCountryChange,
                                      showFlag: true,
                                      showOnlyCountryWhenClosed: false,
                                      showCountryOnly: false,
                                      flagWidth: 50,
                                      textOverflow: TextOverflow.ellipsis,
                                      hideMainText: true,
                                      closeIcon: Icon(Icons.close,
                                          color: Colors.black),
                                      searchDecoration: InputDecoration(
                                        hintText: AppLocalization.search,
                                      ))),
                              Icon(Icons.arrow_drop_down, color: Colors.black)
                            ])),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              textInputAction: TextInputAction.next,
                              focusNode: _telefonNumberFN,
                              onChanged: (value) =>
                                  _registerController.model.phoneNumber = value,
                              validator: (_) =>
                                  _registerController.checkPhoneNumber(),
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_passwordFN),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(color: AppColors.black),
                              decoration: InputDecoration(
                                  labelText: AppLocalization.phoneNumber,
                                  suffixIcon:
                                      Icon(EvaIcons.phone, color: Colors.grey),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelStyle: TextStyle(color: AppColors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10),
                                  ))),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(AppLocalization.selectCity,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)),
                        ),
                        Expanded(flex: 2, child: _buildCityDropDownButton())
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(AppLocalization.selectAccountType,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15))),
                        Expanded(
                            flex: 2, child: _buildAccountTypeDropDownButton())
                      ],
                    ),
                    SizedBox(height: 10),
                    Observer(
                        builder: (_) => TextFormField(
                            style: TextStyle(color: AppColors.black),
                            textInputAction: TextInputAction.next,
                            focusNode: _passwordFN,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_passwordConfirmFN),
                            onChanged: (value) =>
                                _registerController.model.password = value,
                            validator: (_) =>
                                _registerController.checkPassword(),
                            obscureText: !_registerController.showPassword,
                            decoration: InputDecoration(
                                labelText: AppLocalization.password,
                                fillColor: Colors.white,
                                filled: true,
                                labelStyle: TextStyle(color: AppColors.black),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: GestureDetector(
                                    onTap: () => _registerController
                                        .changeViewPassword(),
                                    child: Icon(_registerController.showPassword
                                        ? EvaIcons.eye
                                        : EvaIcons.eyeOff)),
                                border:
                                    OutlineInputBorder(borderRadius: BorderRadius.circular(10))))),
                    SizedBox(height: 10),
                    Observer(
                      builder: (_) => TextFormField(
                          style: TextStyle(color: AppColors.black),
                          textInputAction: TextInputAction.next,
                          focusNode: _passwordConfirmFN,
                          onChanged: (value) =>
                              _registerController.model.passwordConfirm = value,
                          validator: (_) =>
                              _registerController.checkMatchPassword(),
                          obscureText: !_registerController.showPassword,
                          decoration: InputDecoration(
                              labelText: AppLocalization.confirmPassword,
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: AppColors.black),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    _registerController.changeViewPassword(),
                                child: Icon(_registerController.showPassword
                                    ? EvaIcons.eye
                                    : EvaIcons.eyeOff),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                    ),
                  ])),
        ]);
  }

  _buildRegisterButton() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () async {
            KeyBoard.close(context);
            if (_formKey.currentState.validate()) {
              Navigator.of(context).pushReplacementNamed(AppRoute.mainRoute);
              // await _registerController.register(context);
            } else
              _registerController.autoValidate = true;
          },
          text: AppLocalization.register),
    );
  }

  _buildHaveAccount() {
    return GestureDetector(
        onTap: () =>
            Navigator.pushReplacementNamed(context, AppRoute.loginRoute),
        child: Center(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: AppLocalization.haveAccountMsg,
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
            TextSpan(
                text: AppLocalization.login,
                style: TextStyle(
                    color: AppColors.button,
                    fontWeight: FontWeight.w500,
                    fontSize: 17))
          ])),
        ));
  }

  _buildCityDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String city in cityList) {
      var newItem = DropdownMenuItem(
          child: Text(city, overflow: TextOverflow.ellipsis), value: city);
      dropDownItems.add(newItem);
    }
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
          dropdownColor: Colors.white,
          elevation: 7,
          isExpanded: true,
          onChanged: (selectedCity) {
            _registerController.selectedCity(selectedCity);
          },
          value: _registerController.city,
          items: dropDownItems),
    );
  }

  _buildAccountTypeDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String account in accountTypeList) {
      var newItem = DropdownMenuItem(
          child: Text(account, overflow: TextOverflow.ellipsis),
          value: account);
      dropDownItems.add(newItem);
    }
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
          dropdownColor: Colors.white,
          elevation: 7,
          isExpanded: true,
          onChanged: (selectedType) {
            _registerController.selectedAccountType(selectedType);
          },
          value: _registerController.accountType,
          items: dropDownItems),
    );
  }
}
