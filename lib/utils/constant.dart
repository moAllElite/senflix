import 'package:flutter/material.dart';

const kButtonStyle = ButtonStyle(
  textStyle: MaterialStatePropertyAll(
      TextStyle(

   )
  ),
    backgroundColor: MaterialStatePropertyAll(
        Colors.white
    ),
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(5.0)
          ),
        )
    ),
  elevation: MaterialStatePropertyAll(5.0),

);