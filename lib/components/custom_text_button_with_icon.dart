import 'package:flutter/material.dart';
import 'package:senflix/utils/constant.dart';

import 'custom_text.dart';
Widget customTextButtonWithIcon(
    {
      text='play',
      IconData icon=Icons.abc,
      backgrounColor = Colors.white,
      colorIcon = Colors.black,
      double fontSize = 17.0,
      textColor = Colors.black,
      fontWeight= FontWeight.w600
    }
    ){
  return SizedBox(
    height: 40,
    width: 130,
    child: TextButton(
      onPressed: () {  },
      style: kButtonStyle.copyWith(
          backgroundColor: MaterialStatePropertyAll(backgrounColor)
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25.0,
            color: colorIcon,
          ),
          customText(
              text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight
          ),
        ],
      ),
    ),
  );
}