import 'package:flutter/material.dart';

import '../utils/constant.dart';

Widget myTextFieldForm({required String fieldName}){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        fieldName = value;
      },
      validator: (value) {
        if(value == null || value.isEmpty){
          return 'L\'email est requis';
        }
        return null;
      },
      style: kTextStyle,
      decoration: kTextFieldFormDecoration,
    ),
  );
}