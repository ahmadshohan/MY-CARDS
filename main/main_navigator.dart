import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/category/category_page.dart';
import 'package:mycarts/main/favorite/favorite_page.dart';
import 'package:mycarts/main/home/home_page.dart';
import 'package:mycarts/main/settings/settings_page.dart';
import 'package:mycarts/main/shopping_cart/shopping_cart_page.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/shared/widgets/app_search_bar.dart';

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
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light));
    return Scaffold(
        backgroundColor: AppColors.white,
        body: _buildPageViewBuilder(),
        bottomNavigationBar: Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Divider(height: 1),
          _buildBottomNavigationBar()
        ])));
  }

  List<Widget> allPages = [
    HomePage(),
    CategoryPage(),
    ShoppingCartPage(),
    FavoritePage(),
    SettingsPage(),
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
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: AppColors.button),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.button,
            selectedIconTheme: IconThemeData(color: Colors.orange, size: 25),
            unselectedIconTheme: IconThemeData(color: Colors.grey, size: 16),
            selectedLabelStyle: TextStyle(color: Colors.orange, fontSize: 15),
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            showSelectedLabels: true,
            showUnselectedLabels: true,
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
                  icon: Icon(Icons.category),
                  activeIcon: Icon(Icons.category),
                  title: Text('الفئات')),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(EvaIcons.shoppingCart),
                  activeIcon: Icon(EvaIcons.shoppingCart),
                  title: Text('السلة')),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(EvaIcons.heartOutline),
                  activeIcon: Icon(EvaIcons.heartOutline),
                  title: Text("المفضلة")),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.button,
                  icon: Icon(EvaIcons.person),
                  activeIcon: Icon(EvaIcons.person),
                  title: Text("الحساب")),
            ]));
  }
}
