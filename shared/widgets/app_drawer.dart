import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/favorite/favorite_page.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.drawerHeader),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
                radius: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/png/avatar.png',
                        fit: BoxFit.cover))),
            Text(AppLocalization.yourName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.white))
          ])),
      Expanded(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.drawerBody),
              child: Column(children: [
                _buildMainMenu(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildMyShoppingCart(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildFavorite(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildWishes(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildEvaluation(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildMessageUs(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildComplaints(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildMyAward(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildAccount(),
                Divider(
                    height: 0.9,
                    color: AppColors.white,
                    indent: 10,
                    endIndent: 10),
                _buildAbout()
              ])))
    ]));
  }

  _buildMainMenu() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, AppRoute.mainRoute),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(Icons.home, color: AppColors.white),
            SizedBox(width: 13),
            Text('القائمة الرئيسية',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildMyShoppingCart() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.shoppingCartRoute),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(Icons.shopping_cart, color: AppColors.white),
            SizedBox(width: 13),
            Text('مشترياتي',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildFavorite() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage())),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(Icons.star, color: AppColors.white),
            SizedBox(width: 13),
            Text('المفضلة',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildWishes() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.wishesRoute),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.gift, color: AppColors.white),
            SizedBox(width: 13),
            Text('الأمنيات',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildEvaluation() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.rateusRoute),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(Icons.star, color: AppColors.white),
            SizedBox(width: 13),
            Text('التقييم',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildMessageUs() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage())),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.email, color: AppColors.white),
            SizedBox(width: 13),
            Text('راسلنا',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildComplaints() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.reversionRoute),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.compass, color: AppColors.white),
            SizedBox(width: 13),
            Text('الشكاوي',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildMyAward() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage())),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.compass, color: AppColors.white),
            SizedBox(width: 13),
            Text('مكافأتي',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildAccount() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.profileRoute),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(EvaIcons.person, color: AppColors.white),
            SizedBox(width: 13),
            Text('الحساب',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }

  _buildAbout() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.aboutRoute),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(children: <Widget>[
            Icon(Icons.help_outline, color: AppColors.white),
            SizedBox(width: 13),
            Text('حول',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w500)),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.white)
          ])),
    );
  }
}
