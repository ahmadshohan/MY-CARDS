import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/widgets/dialogs/AppDialogs.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/product/product_detail/product_detail_controller.dart';
import 'package:mycarts/shared/widgets/single_product_vertical.dart';
import 'package:mycarts/provider/products.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductDetailController _controller = ProductDetailController();
  @override
  void initState() {
    super.initState();
    _controller.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productsData = Provider.of<Products>(context);
    final loadedProduct = productsData.findById(productId);
    final productCategory = loadedProduct.category;
    final productList = productsData.productsList;
    final productsFilterd = productList.where((product) {
      return product.category.contains(productCategory);
    }).toList();

    return Scaffold(
        appBar: AppBar(backgroundColor: AppColors.button, actions: [
          IconButton(
              icon: Icon(Icons.search, color: AppColors.white),
              onPressed: () {
                showSearch(context: context, delegate: AppSearch());
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: AppColors.white),
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AppRoute.shoppingCartRoute))
        ]),
        body: Observer(
            builder: (_) => SafeArea(
                top: true,
                bottom: false,
                right: false,
                left: false,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomScrollView(slivers: <Widget>[
                      _sliverProductPhotosBar(loadedProduct),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        _buildSingleProductWithoutPicture(),
                        if (loadedProduct.category == 'pubg')
                          _buildPubgInputs(),
                        _moreProductRelated(productsFilterd),
                        _buildProductPrice(loadedProduct),
                      ]))
                    ])))),
        bottomNavigationBar: _bottomBuyAddButtons(productsData, loadedProduct));
  }

  _sliverProductPhotosBar(Product loadedProduct) {
    return SliverAppBar(
        backgroundColor: AppColors.cardItemBg,
        snap: true,
        floating: true,
        automaticallyImplyLeading: false,
        expandedHeight: MediaQuery.of(context).size.height * 0.3,
        flexibleSpace: FlexibleSpaceBar(
            background: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: AppColors.cardItemBg,
                child: _buildProductPicture(loadedProduct))));
  }

  _buildProductPicture(Product loadedProduct) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.29,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Carousel(
                images: [
                  Image.asset(loadedProduct.image,
                      fit: BoxFit.fill, filterQuality: FilterQuality.high),
                  Image.asset(loadedProduct.image,
                      fit: BoxFit.fill, filterQuality: FilterQuality.high),
                  Image.asset(loadedProduct.image,
                      fit: BoxFit.fill, filterQuality: FilterQuality.high),
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

  _buildSingleProductWithoutPicture() {
    return Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text('رصيد البلايستيشن105',
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3C3C))),
                Spacer(),
                Image.asset(
                  'assets/png/dream-catcher.png',
                  height: 30,
                  width: 30,
                ),
                Icon(EvaIcons.star, color: AppColors.button),
              ]),
              Row(children: [
                Text('تقييم الزبائن للمنتج ',
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3C3C))),
                Icon(EvaIcons.star, color: Colors.amber),
                Icon(EvaIcons.star, color: Colors.amber),
                Icon(EvaIcons.star, color: Colors.amber),
                Icon(EvaIcons.star, color: Colors.amber),
                Icon(EvaIcons.star, color: Colors.amber),
              ]),
              SizedBox(height: 10),
              Text(
                  'اشحن رصيد جوالك في السعودية عبر الانترنت باستخدام بطاقات شحن بلايستيشن المتاحة بالعديد من الفئات المختلفة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3C3C3C))),
              SizedBox(height: 10),
              Text('لمعرفة لمزيد من التفاصيل عن البطاقة وكيفية استخدامها',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3C3C3C))),
              SizedBox(height: 10),
              Center(
                child: Text('اضغط هنا',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.button)),
              )
            ])));
  }

  _pubgChargerKinds() {
    return Column(children: [
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer5,
                        onChanged: (value) => _controller.selectedOffer5(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text('life After 60 +5 Credits Code',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black)),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 60+5 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer30,
                        onChanged: (value) => _controller.selectedOffer30(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text('life After 300 +30 Credits Code',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black)),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 300+30 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer58,
                        onChanged: (value) => _controller.selectedOffer58(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Text('life After 500 +58 Credits Code',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black))),
                              SizedBox(width: 10),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 500+58 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer128,
                        onChanged: (value) => _controller.selectedOffer128(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('life After 980 +128 Credits Code',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black)),
                              SizedBox(width: 10),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 980+128 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer288,
                        onChanged: (value) => _controller.selectedOffer288(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text('life After 1980 +288 Credits Code',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black)),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 1980 +288 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer440,
                        onChanged: (value) => _controller.selectedOffer440(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text('life After 2980 +288 Credits Code',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black)),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 2980 +288 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      )))),
      Card(
          child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.orange),
              child: Observer(
                  builder: (_) => CheckboxListTile(
                        activeColor: Colors.blue,
                        checkColor: AppColors.button,
                        value: _controller.offer880,
                        onChanged: (value) => _controller.selectedOffer880(),
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('life After 4880 +888 Credits Code',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black)),
                              SizedBox(width: 5),
                              SizedBox(
                                  height: 30,
                                  child: RaisedButton(
                                      child: Text(" promotion",
                                          style: TextStyle(fontSize: 11)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      color: AppColors.button,
                                      textColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      onPressed: () {}))
                            ]),
                        subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'Buy 1*life After 4880 +888 Credits Discount :5%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black))),
                      ))))
    ]);
  }

  _buildPubgInputs() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _pubgChargerKinds(),
                Text('player name',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                SizedBox(height: 5),
                TextFormField(
                    style: TextStyle(color: AppColors.black),
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.fullName = value,
                    // validator: (_) => _registerController.checkFullName(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    decoration: InputDecoration(
                        hintText: 'ahmad shohan',
                        hintStyle: TextStyle(fontSize: 14),
                        fillColor: AppColors.white,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
                SizedBox(height: 10),
                Text(' player ID',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                SizedBox(height: 5),
                TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                    // onChanged: (value) =>
                    //     _registerController.model.email = value,
                    // validator: (_) => _registerController.checkEmail(),
                    onFieldSubmitted: (_) => KeyBoard.close(context),
                    style: TextStyle(color: AppColors.black),
                    decoration: InputDecoration(
                        hintText: 'ahmad shohan',
                        hintStyle: TextStyle(fontSize: 14),
                        fillColor: Colors.white10,
                        filled: true,
                        labelStyle: TextStyle(color: AppColors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ))),
              ]),
        ]);
  }

  _moreProductRelated(List<Product> productsFilterd) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: productsFilterd.length,
            itemBuilder: (ctx, index) => Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ChangeNotifierProvider.value(
                    value: productsFilterd[index],
                    child: SingleProductVertical()))));
  }

  _buildProductPrice(Product loadedProduct) {
    return Column(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
                style: TextStyle(textBaseline: TextBaseline.alphabetic),
                children: [
              TextSpan(
                  text: 'سعر المنتج الأجمالي',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 17,
                  )),
              TextSpan(
                  text: '${27.99}\$',
                  style: TextStyle(
                    color: AppColors.button,
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ))
            ])),
        Text('ستحصل على 11 نقطة مكافئة عند شراء المنتج',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 17,
            ))
      ],
    );
  }

  _bottomBuyAddButtons(Products productsData, Product loadedProduct) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white30,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Divider(),
          Row(children: <Widget>[
            Expanded(
                child: JRaisedButton(
                    text: 'اشتري الآن',
                    onPressed: () => Navigator.pushNamed(
                        context, AppRoute.paymentMethodRoute))),
            SizedBox(width: 15),
            Expanded(
                child: JRaisedButton(
                    text: 'إضافة الى السلة',
                    onPressed: () async {
                      productsData.addCart(
                        productId: loadedProduct.id,
                        title: loadedProduct.name,
                        quantity: _controller.quantity,
                        currentPrice: loadedProduct.currentPrice,
                        oldPrice: loadedProduct.oldPrice,
                        isFavorite: loadedProduct.isFavorite,
                        isWish: loadedProduct.isWish,
                        image: loadedProduct.image,
                        size: _controller.size,
                      );
                      AppDialogs.successCartAddedDialog(context);
                    }))
          ])
        ]));
  }
}
