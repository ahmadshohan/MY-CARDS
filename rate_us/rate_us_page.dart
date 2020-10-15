import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:mycarts/colors.dart';

class RateUsPage extends StatefulWidget {
  static const routeName = '/rate-us';
  @override
  _RateUsPageState createState() => new _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  double rating = 2.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.button,
            title: Text('التقييم', overflow: TextOverflow.ellipsis),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.search, color: AppColors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: AppColors.white),
                  onPressed: () {}),
            ]),
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.only(bottom: 50.0),
                  child: new StarRating(
                      size: 45.0,
                      rating: rating,
                      color: Colors.orange,
                      borderColor: Colors.grey,
                      starCount: starCount,
                      onRatingChanged: (rating) => setState(
                            () {
                              this.rating = rating;
                            },
                          ))),
              new Text(
                "Your rating is: $rating",
                style: new TextStyle(fontSize: 30.0),
              )
            ]));
  }
}
