import 'package:flutter/material.dart';
import 'package:senflix/utils/constant.dart';

Widget titleSectionWidget(
    {required String data}
    ){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 9.0),
    alignment: Alignment.topLeft,
    child: Text(
      data,
      style: kTitleStyle,
    )
  );
}