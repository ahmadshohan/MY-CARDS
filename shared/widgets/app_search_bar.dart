import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/main/settings/settings_page.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AppSearchBar {
  static buildFullAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.button,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(EvaIcons.menu, color: AppColors.white),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => SettingsPage())),
      ),
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Row(children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        // controller: _searchController,
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          KeyBoard.close(context);
                          /*todo handle search*/
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon:
                                Icon(EvaIcons.search, color: Colors.white),
                            hintText: "search",
                            hintStyle: TextStyle(color: Colors.blueGrey)))))
          ])),
      // actions: [
      //   IconButton(
      //     icon: Icon(
      //       Icons.filter_list,
      //       color: AppColors.white,
      //     ),
      //     onPressed: () {},
      //   )
      // ]
    );
  }
}
