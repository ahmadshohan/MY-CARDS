import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/favorite/favorite_page.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          child: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              _buildProfilePictureName(),
              _buildMainMenu(),
              _buildMyOrders(),
              _buildFavorite(),
              _buildReversion(),
              _buildEditProfile(),
              _buildLogout(),
            ])),
          )),
    );
  }

  _buildProfilePictureName() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: AppColors.button,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    icon:
                        Icon(EvaIcons.arrowForward, color: AppColors.white),
                    onPressed: () => Navigator.pop(context)),
                Text('الحساب',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
                SizedBox()
              ]),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/png/avatar.png',
                            width: 150, height: 150, fit: BoxFit.cover),
                      )),
                  Text(AppLocalization.yourName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.white))
                ],
              )
            ]));
  }

  _buildMainMenu() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, AppRoute.mainRoute),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(children: <Widget>[
            Icon(Icons.location_on, color: AppColors.black),
            SizedBox(width: 13),
            Text('القائمة الرئيسية',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }

  _buildMyOrders() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.ordersRoute),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(children: <Widget>[
            Icon(Icons.notifications, color: AppColors.black),
            SizedBox(width: 13),
            Text('طلباتي',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }

  _buildFavorite() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage())),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(children: <Widget>[
            Icon(Icons.favorite, color: AppColors.black),
            SizedBox(width: 13),
            Text('المفضلة',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }

  _buildReversion() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoute.reversionRoute),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(children: <Widget>[
            Icon(Icons.assignment_return, color: AppColors.black),
            SizedBox(width: 13),
            Text('الإسترجاع',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }

  _buildEditProfile() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.profileRoute),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Row(children: <Widget>[
            Icon(Icons.person, color: AppColors.black),
            SizedBox(width: 13),
            Text('تعديل الحساب',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }

  _buildLogout() {
    return GestureDetector(
      onTap: () async {
        // await _settingsController.logout(context);
        Navigator.of(context).pushReplacementNamed(AppRoute.loginRoute);
      },
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.logOut, color: AppColors.black),
            SizedBox(width: 13),
            Text(AppLocalization.logout,
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.black)
          ])),
    );
  }
}
