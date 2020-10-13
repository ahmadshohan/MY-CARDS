import 'package:flutter/material.dart';

class SpecialUserPlayLists extends StatefulWidget {
  @override
  _SpecialUserPlayListsState createState() => _SpecialUserPlayListsState();
}

class _SpecialUserPlayListsState extends State<SpecialUserPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Text('dd');
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     Text(AppLocalization.specialPlaylistUserMsg,
    //         style: TextStyle(
    //             fontSize: 16.0,
    //             color: ThisMusicColors.white,
    //             fontWeight: FontWeight.bold,
    //             letterSpacing: 1.2)),
    //     SizedBox(
    //       height: 12,
    //     ),
    //     Column(
    //       children: <Widget>[
    //         Container(
    //           height: 150,
    //           child: ListView.builder(
    //             shrinkWrap: true,
    //             scrollDirection: Axis.horizontal,
    //             itemCount: 4,
    //             itemBuilder: (BuildContext context, int index) {
    //               return GestureDetector(
    //                 onTap: () => {/*TODO handle go Special User PlayLists*/},
    //                 child: Container(
    //                   width: 140,
    //                   // margin: index == widget.alubums.length - 1
    //                   //     ? EdgeInsets.only(right: 20.0)
    //                   //     : EdgeInsets.only(right: 0.0),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       ClipRRect(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         child: Image(
    //                           height: 120.0,
    //                           width: 120.0,
    //                           image: AssetImage('assets/lang/turkey.png'),
    //                           // image: CachedNetworkImageProvider(
    //                           //     'assets/lang/turkey.png'),
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     )
    //   ]);
  }
}
