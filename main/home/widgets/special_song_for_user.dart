import 'package:mycarts/main/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SpecialSongsForUser extends StatefulWidget {
  @override
  _SpecialSongsForUserState createState() => _SpecialSongsForUserState();
}

class _SpecialSongsForUserState extends State<SpecialSongsForUser> {
  HomePageController _controller = HomePageController();
  @override
  void initState() {
    super.initState();
    // _controller.bestSongsHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,

      child: Text('dd'),
      // child:
      // Observer(
      //     builder: (_) => Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(AppLocalization.specialAlbumsUserMsg,
      //                   style: TextStyle(
      //                       fontSize: 16.0,
      //                       color: ThisMusicColors.white,
      //                       fontWeight: FontWeight.bold,
      //                       letterSpacing: 1.2)),
      //               SizedBox(height: 12),
      //               Column(children: <Widget>[
      //                 Container(
      //                     height: 150,
      //                     child: ListView.builder(
      //                         shrinkWrap: true,
      //                         scrollDirection: Axis.horizontal,
      //                         itemCount: 4,
      //                         itemBuilder: (BuildContext context, int index) {
      //                           return GestureDetector(
      //                               onTap: () => Navigator.pushNamed(
      //                                   context, AppRoute.musicPlayerRoute,
      //                                   arguments:
      //                                       _controller.bestSongsData[index]),
      //                               child: Container(
      //                                   width: 140,
      //                                   child: Column(
      //                                       crossAxisAlignment:
      //                                           CrossAxisAlignment.start,
      //                                       children: <Widget>[
      //                                         ClipRRect(
      //                                             borderRadius:
      //                                                 BorderRadius.circular(
      //                                                     20.0),
      //                                             child: Image(
      //                                               height: 120.0,
      //                                               width: 120.0,
      //                                               fit: BoxFit.cover,
      //                                               image:
      //                                                   // CachedNetworkImageProvider(
      //                                                   //     "${SocialMedia.urlPrefix + _controller.bestSongsData[index].avatar}")
      //                                                   AssetImage(
      //                                                       'assets/lang/turkey.png'),
      //                                             )),
      //                                       ])));
      //                         }))
      //               ])
      //             ]))
    );
  }
}
