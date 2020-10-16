import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycarts/about/about_page.dart';
import 'package:mycarts/complaints/complaints_page.dart';
import 'package:mycarts/main/all_products/all_products_page.dart';
import 'package:mycarts/message_us/message_us_page.dart';
import 'package:mycarts/rate_us/rate_us_page.dart';
import 'package:mycarts/wishes/wishes_page.dart';
import 'package:provider/provider.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/myreward/myreward_page.dart';
import 'package:mycarts/account/forgot_password/forget_password_page.dart';
import 'package:mycarts/account/login/login_page.dart';
import 'package:mycarts/account/register/register_page.dart';
import 'package:mycarts/account/welcome/welcome_page.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/settings/orders/orders_page.dart';
import 'package:mycarts/main/settings/profile/edit_profile/edit_profile_page.dart';
import 'package:mycarts/main/settings/profile/profile_page.dart';
import 'package:mycarts/main/shopping_cart/shopping_cart_page.dart';
import 'package:mycarts/payment/payment_customer_information/payment_customer_information.dart';
import 'package:mycarts/payment/payment_detail/payment_detail.dart';
import 'package:mycarts/payment/payment_method/payment_method_page.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mycarts/main/main_navigator.dart';
import 'package:mycarts/product/product_detail/product_details_page.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/splash/splash_page.dart';

class MyCartsApp extends StatefulWidget {
  @override
  MyCartsAppState createState() => MyCartsAppState();
}

class MyCartsAppState extends State<MyCartsApp> {
  final _fontFamily = 'poppins';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.navigationBar,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(create: (ctx) => Orders()),
        ],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'MY CARDS',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.button,
                canvasColor: AppColors.bg,
                appBarTheme: Theme.of(context).appBarTheme.copyWith(
                    color: AppColors.playerGradientLow,
                    iconTheme: IconThemeData(color: Colors.white)),
                fontFamily: _fontFamily),
            initialRoute: AppRoute.splashRoute,
            routes: {
              AppRoute.splashRoute: (ctx) => SplashPage(),
              AppRoute.welcomeRoute: (ctx) => WelcomePage(),
              AppRoute.registerRoute: (ctx) => RegisterPage(),
              AppRoute.loginRoute: (ctx) => LoginPage(),
              AppRoute.forgotPasswordRoute: (ctx) => ForgotPasswordPage(),
              AppRoute.mainRoute: (ctx) => MainNavigator(),
              AppRoute.allProductsRoute: (ctx) => AllProductsPage(),
              AppRoute.wishesRoute: (ctx) => WishesPage(),
              AppRoute.productDetailRoute: (ctx) => ProductDetails(),
              AppRoute.profileRoute: (ctx) => ProfilePage(),
              AppRoute.editProfileRoute: (ctx) => EditProfilePage(),
              AppRoute.aboutRoute: (ctx) => AboutPage(),
              AppRoute.rateusRoute: (ctx) => RateUsPage(),
              AppRoute.messageusRoute: (ctx) => MessageUsPage(),
              AppRoute.complaintsRoute: (ctx) => ComplaintsPage(),
              AppRoute.myrewardsRoute: (ctx) => MyRewardsPage(),
              AppRoute.shoppingCartRoute: (ctx) => ShoppingCartPage(),
              AppRoute.ordersRoute: (ctx) => OrdersPage(),
              AppRoute.paymentMethodRoute: (ctx) => PaymentMethodPage(),
              AppRoute.paymentDetailRoute: (ctx) => PaymentDetailPage(),
              AppRoute.paymentCustomerInformationRoute: (ctx) =>
                  PaymentCustomerInformationPage(),
            }));
  }

  static void setLang(BuildContext context, String lang) async {
    AppLocalization.setLang(context, lang);
    MyCartsAppState state = context.findAncestorStateOfType<MyCartsAppState>();
    state.setState(() {});
  }
}
