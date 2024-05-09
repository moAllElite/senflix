import 'package:flutter/material.dart';
import 'package:senflix/utils/constant.dart';
import 'custom_text.dart';
Widget textButtonWithIcon(
    {
      text='play',
      required  backgroundColor,
      IconData icon=Icons.abc,
      double fontSize = 17.0,
      fontWeight= FontWeight.w600,
     required Color color
    }
    ){

  return TextButton(
    onPressed: () {  },
    style: kButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(backgroundColor)
    ),
    child:Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25.0,
            color:color
          ),
          customText(
              text,
              color:color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            textAlign: TextAlign.center
          ),
        ],
      ),
    ),
  );
}