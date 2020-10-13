import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';

class JRaisedButtonBorder extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const JRaisedButtonBorder({Key key, this.onPressed, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColors.button,
        textColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color),
        ),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ));
  }
}
