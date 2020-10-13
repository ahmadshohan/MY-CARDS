import 'package:mycarts/reversion/reversion_controller.dart';
import 'package:mycarts/shared/constant/data_list.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ReversionPage extends StatefulWidget {
  @override
  _ReversionPageState createState() => _ReversionPageState();
}

class _ReversionPageState extends State<ReversionPage> {
  ReversionPageController _controller = ReversionPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.button,
          title: Center(
            child: Text('الأسترجاع',
                overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          )),
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
                                  _buildReversionDropDownButton(),
                                  SizedBox(height: 15),
                                  _buildReversionReason()
                                ])))),
                Visibility(
                    visible: _controller.loading,
                    child: Center(child: Loader()))
              ])),
      bottomNavigationBar: _buildSendButton(),
    );
  }

  _buildReversionDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in reversionList) {
      var newItem = DropdownMenuItem(
          child: Text(item, overflow: TextOverflow.ellipsis), value: item);
      dropDownItems.add(newItem);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('أختر المنتج',
            style: TextStyle(color: Colors.black, fontSize: 17)),
        SizedBox(height: 10),
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButton<String>(
              isExpanded: true,
              isDense: true,
              elevation: 7,
              onChanged: (selectedItem) {
                _controller.reversionItemChange(selectedItem);
              },
              value: _controller.reversionItem,
              items: dropDownItems),
        ),
      ],
    );
  }

  _buildReversionReason() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('سبب الإرجاع',
              style: TextStyle(color: Colors.black, fontSize: 17)),
          SizedBox(height: 10),
          TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                KeyBoard.close(context);
              },
              maxLines: 6,
              style: TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                  hintText: "اكتب ملاحظة .......",
                  fillColor: Colors.white10,
                  filled: true,
                  labelStyle: TextStyle(color: AppColors.black),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                  )))
        ]);
  }

  _buildSendButton() {
    return Container(
        height: 50,
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        width: double.infinity,
        child: JRaisedButton(
            onPressed: () async {
              KeyBoard.close(context);
            },
            text: 'أرسال'));
  }
}
