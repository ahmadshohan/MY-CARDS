import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/widgets/dialogs/AppDialogs.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/product/product_detail/widgets/peoduct_detail_tab_bar.dart';
import 'package:mycarts/product/product_detail/product_detail_controller.dart';
import 'package:mycarts/shared/constant/data_list.dart';
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
              onPressed: () {}),
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
                        _buildSingleProductWithoutPicture(loadedProduct),
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
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(loadedProduct.image, fit: BoxFit.cover)),
        ));
  }

  _buildSingleProductWithoutPicture(Product loadedProduct) {
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
              Icon(EvaIcons.star, color: AppColors.button),
              Icon(EvaIcons.gift, color: AppColors.button)
            ]),
            Row(children: [
              Text('تقييم المشتركين للبطاقة ',
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
            ),
          ]),
        ));
  }

  _moreProductRelated(List<Product> productsFilterd) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35,
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
