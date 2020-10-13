import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

class ProductDetailTabsBar extends StatefulWidget {
  final product;

  ProductDetailTabsBar(this.product);
  _ProductDetailTabsBarState createState() => _ProductDetailTabsBarState();
}

class _ProductDetailTabsBarState extends State<ProductDetailTabsBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Card(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorWeight: 4.0,
                    indicatorColor: Colors.deepOrange,
                    unselectedLabelColor: AppColors.black,
                    labelColor: AppColors.button,
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    tabs: <Widget>[
                      Tab(
                          child: Text('الوصف',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center)),
                      Tab(
                          child: Text('مزيدمن المعلومات',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center)),
                      Tab(
                          child: Text('المراجعات',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center))
                    ]),
                body: TabBarView(controller: _tabController, children: <Widget>[
                  Text(AppLocalization.loremLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start),
                  Text(AppLocalization.loremLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start),
                  Text(AppLocalization.loremLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start),
                ]))),
      ),
    );
  }
}
