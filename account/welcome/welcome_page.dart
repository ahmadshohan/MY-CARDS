import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mycarts/account/welcome/welcome_controller.dart';
import 'package:mycarts/app_route.dart';
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
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoute.registerRoute),
                                child: Text('تخطي',
                                    style: TextStyle(
                                        color: AppColors.button,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(height: 5),
                              _buildSliderWelcomeInformationCarousel(),
                            ]))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _bottomLoginRegisterButtons(),
    );
  }

  _buildSliderWelcomeInformationCarousel() {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Carousel(
                  images: [
                    ExactAssetImage("assets/png/temp_news.png"),
                    ExactAssetImage("assets/png/temp_news.png"),
                    ExactAssetImage("assets/png/temp_news.png"),
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
            )));
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
                  text: 'تسجيل الدخول')),
          SizedBox(width: 15),
          Expanded(
              child: JOutlineButton(
                  color: AppColors.button,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoute.registerRoute),
                  text: 'حساب جديد')),
        ]));
  }
}
