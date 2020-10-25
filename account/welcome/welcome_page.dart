import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mycarts/account/welcome/welcome_controller.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/app_widget.dart';
import 'package:mycarts/shared/constant/payment_method.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/j_outline_button.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:mycarts/colors.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  WelcomeController _controller = WelcomeController();
  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildPopupMenuLanguageButton(),
                                      InkWell(
                                        onTap: () =>
                                            Navigator.pushReplacementNamed(
                                                context, AppRoute.mainRoute),
                                        child: Text(AppLocalization.skip,
                                            style: TextStyle(
                                                color: AppColors.button,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  _buildSliderWelcomeInformationCarousel(),
                                  SizedBox(height: 20),
                                  _bottomLoginRegisterButtons(),
                                ])),
                      )),
                  Visibility(
                      visible: _controller.loading,
                      child: Center(child: Loader()))
                ])));
  }

  _buildSliderWelcomeInformationCarousel() {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Carousel(
                images: [
                  ExactAssetImage("assets/png/welcome_slider_1.png"),
                  ExactAssetImage("assets/png/welcome_slider_2.png"),
                  ExactAssetImage("assets/png/welcome_slider_3.png"),
                  ExactAssetImage("assets/png/welcome_slider_4.png"),
                ],
                // images: _controller.sliderData
                //     .map((slider) => GestureDetector(
                //         onTap: () => Navigator.of(context).pushNamed(
                //             AppRoute.musicPlayerRoute,
                //             arguments: slider),
                //         child: slider.contents?.avatar1 != null
                //             ? CachedNetworkImage(
                //                 imageUrl:
                //                     "${SocialMedia.urlPrefix + slider.contents.avatar1}")
                //             : AssetImage("assets/png/temp_news.png")
                // CachedNetworkImage(
                //     imageUrl:
                //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                // ExactAssetImage("assets/page_design/home_page.jpeg"),
                // ))
                // .toList(),
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: AppColors.button,
                dotPosition: DotPosition.bottomCenter,
                indicatorBgPadding: 5.0,
                borderRadius: true,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true),
          ),
        ));
  }

  _bottomLoginRegisterButtons() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white30,
        child: Row(children: <Widget>[
          Expanded(
              child: JRaisedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoute.loginRoute),
                  text: AppLocalization.login)),
          SizedBox(width: 15),
          Expanded(
              child: JOutlineButton(
                  color: AppColors.button,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoute.registerRoute),
                  text: AppLocalization.register)),
        ]));
  }

  _buildPopupMenuLanguageButton() {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        onSelected: (PopLanguageOption selectedLanguage) {
          setState(() {
            if (selectedLanguage == PopLanguageOption.English) {
              MyCartsAppState.setLang(context, AppLocalization.en);
              _controller.init();
            } else {
              MyCartsAppState.setLang(context, AppLocalization.ar);
              _controller.init();
            }
          });
        },
        icon: Container(
            width: 30,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.button, width: 2)),
            child: Text(_controller.selectedLang,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black))),
        itemBuilder: (_) => [
              PopupMenuItem(
                  child: _buildLanguageRow('assets/lang/saudi.png', 'العربية'),
                  value: PopLanguageOption.Arabic),
              PopupMenuItem(
                  child: _buildLanguageRow('assets/lang/usa.png', 'English'),
                  value: PopLanguageOption.English)
            ]);
  }

  _buildLanguageRow(String image, String name) {
    return Row(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(1.0),
            decoration: new BoxDecoration(
              color: Colors.white, // border color
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(image, width: 24, height: 24))),
        SizedBox(width: 10),
        Container(
            child: Text(name), padding: EdgeInsets.only(left: 5, right: 5))
      ],
    );
  }
}
