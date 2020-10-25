import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/favorite/favorite_page.dart';
import 'package:mycarts/main/home/home_page.dart';
import 'package:mycarts/main/settings/profile/profile_page.dart';
import 'package:mycarts/main/shopping_cart/shopping_cart_page.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    KeyBoard.close(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.button,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light));
    return Scaffold(
        backgroundColor: AppColors.appBg,
        body: _buildPageViewBuilder(),
        bottomNavigationBar: Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[_buildBottomNavigationBar()])));
  }

  List<Widget> allPages = [
    HomePage(),
    FavoritePage(),
    ShoppingCartPage(),
    ProfilePage(),
  ];

  _buildPageViewBuilder() {
    return PageView.builder(
      itemBuilder: (ctx, index) => PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, seconderyAnimation) {
          return FadeThroughTransition(
              fillColor: AppColors.white,
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: seconderyAnimation);
        },
        child: allPages[index],
      ),
      itemCount: allPages.length,
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  _buildBottomNavigationBar() {
    return Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(color: AppColors.button),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.button,
            elevation: 0,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            unselectedIconTheme: IconThemeData(color: Colors.white30, size: 25),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              _pageController.jumpToPage(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home),
                  title: Text('الرئيسية')),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(Icons.star),
                  activeIcon: Icon(Icons.star),
                  title: Text('المفضلة')),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(EvaIcons.shoppingCart),
                  activeIcon: Icon(EvaIcons.shoppingCart),
                  title: Text('السلة')),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(EvaIcons.person),
                  activeIcon: Icon(EvaIcons.person),
                  title: Text("الحساب")),
            ]));
  }
}
