import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/product/product_detail/product_details_page.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:provider/provider.dart';

class AppSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return InkWell(
        onTap: () {
          KeyBoard.close(context);
          close(context, null);
        },
        child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              progress: transitionAnimation,
            )));
  }

  @override
  Widget buildResults(BuildContext context) {
    /*todo go to product detail page*/
    return Text('dd');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productsData = Provider.of<Products>(context).productsList;
    final recentProduct =
        productsData.where((prod) => prod.category == 'pubg').toList();
    final suggestionsList = query.isEmpty
        ? recentProduct
        : productsData
            .where((product) =>
                product.name.startsWith(query) ||
                product.descreption.startsWith(query))
            .toList();
    return suggestionsList.isEmpty
        ? Center(
            child: Text(
            'لم يتم العثور على نتائج...',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, color: AppColors.button),
          ))
        : ListView.builder(
            itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      onTap: () => showResults(context),
                      leading: Icon(Icons.credit_card),
                      title: RichText(
                          text: TextSpan(
                              text: suggestionsList[index]
                                  .name
                                  .substring(0, query.length),
                              style: TextStyle(
                                  color: AppColors.button,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: suggestionsList[index]
                                    .name
                                    .substring(query.length),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                children: []),
                          ])),
                      subtitle: Text(
                        suggestionsList[index].descreption,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: CircleAvatar(
                          radius: 30,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                suggestionsList[index].image,
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                              )))),
                  Divider(endIndent: 20.0, indent: 20.0, thickness: 1)
                ]),
            itemCount: suggestionsList.length,
          );
  }
}
