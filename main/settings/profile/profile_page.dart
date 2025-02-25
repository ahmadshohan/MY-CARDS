import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/settings/profile/profile_controller.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/shared/widgets/loader.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController _controller = ProfileController();

  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: 1000), () async {
      await _controller.init();
      await _controller.profile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.button,
            centerTitle: true,
            title: Text(AppLocalization.profile,
                style: TextStyle(color: Colors.white))),
        body: Observer(
          builder: (_) => SafeArea(
              top: true,
              bottom: true,
              left: false,
              right: false,
              child: Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 5),
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      _buildPersonalInfo(),
                    ]))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
        ));
  }

  _buildAvatar() {
    return Observer(
      builder: (_) => CircleAvatar(
        radius: 50,
        backgroundColor: Colors.black12,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/png/avatar.png')
            //     Image.network(
            // "${_controller.settingPath + _controller.profileData?.avatar}")

            ),
      ),
    );
  }

  _buildPersonalInfo() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildAvatar(),
              SizedBox(height: 13),
              _buildName(),
              SizedBox(height: 13),
              _buildEmail(),
              SizedBox(height: 13),
              _buildPhoneNumber(),
              SizedBox(height: 13),
              _buildCity(),
              SizedBox(height: 13),
              _buildPassword(),
              SizedBox(height: 13),
              _buildEditInfo(),
            ]));
  }

  _buildName() {
    return Observer(
      builder: (_) => TextFormField(
          initialValue:
              _controller.profileData?.name ?? AppLocalization.yourName,
          enabled: false,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
              labelText: AppLocalization.yourName,
              fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(color: AppColors.black),
              contentPadding: EdgeInsets.all(16),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.button)),
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5)))),
    );
  }

  _buildEmail() {
    return Observer(
      builder: (_) => TextFormField(
          initialValue: _controller.profileData?.email ?? AppLocalization.email,
          enabled: false,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
              labelText: AppLocalization.email,
              fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(color: AppColors.black),
              contentPadding: EdgeInsets.all(16),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.button)),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
              ))),
    );
  }

  _buildPhoneNumber() {
    return Observer(
      builder: (_) => TextFormField(
          initialValue:
              _controller.profileData?.phone ?? AppLocalization.phoneNumber,
          enabled: false,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
              labelText: AppLocalization.phoneNumber,
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle(color: AppColors.black),
              contentPadding: EdgeInsets.all(16),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.button)),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
              ))),
    );
  }

  _buildCity() {
    return Observer(
      builder: (_) => TextFormField(
          initialValue:
              _controller.profileData.city?.name ?? AppLocalization.selectCity,
          enabled: false,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
              labelText: 'المحافظة',
              suffixIcon: Icon(Icons.arrow_drop_down, color: AppColors.black),
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle(color: AppColors.black),
              contentPadding: EdgeInsets.all(16),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.button)),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
              ))),
    );
  }

  _buildPassword() {
    return TextFormField(
        initialValue: AppLocalization.password,
        enabled: false,
        style: TextStyle(color: AppColors.black),
        decoration: InputDecoration(
            labelText: AppLocalization.password,
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(color: AppColors.black),
            contentPadding: EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildEditInfo() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppRoute.editProfileRoute),
          text: AppLocalization.editInformations),
    );
  }
}
