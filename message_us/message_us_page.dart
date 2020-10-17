import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mycarts/colors.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/message_us/message_us_controller.dart';
import 'package:mycarts/shared/search/app_search.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';

class MessageUsPage extends StatefulWidget {
  @override
  _MessageUsPageState createState() => new _MessageUsPageState();
}

class _MessageUsPageState extends State<MessageUsPage> {
  MessageUsController _controller = MessageUsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.button,
          title: Text('راسلنا', overflow: TextOverflow.ellipsis),
          centerTitle: true,
          actions: [
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  _buildWriteNoteInput(),
                                  SizedBox(height: 30),
                                  _buildImage(),
                                ])))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _buildSendButton(),
    );
  }

  _buildWriteNoteInput() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('نسعد بمشاركتنا اي استفسار',
              style: TextStyle(color: Colors.black, fontSize: 19)),
          SizedBox(height: 10),
          TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                KeyBoard.close(context);
              },
              maxLines: 5,
              style: TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                  hintText: 'اكتب شيئ ......',
                  fillColor: Colors.white10,
                  filled: true,
                  labelStyle: TextStyle(color: AppColors.black),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                  )))
        ]);
  }

  _buildImage() {
    return Center(
      child: Image.asset(
        'assets/png/message_us.png',
        fit: BoxFit.cover,
      ),
    );
  }

  _buildSendButton() {
    return Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        width: double.infinity,
        child: JRaisedButton(
            onPressed: () async {
              KeyBoard.close(context);
            },
            text: 'أرسال'));
  }
}
