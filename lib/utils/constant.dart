import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

var kTitleStyle =  GoogleFonts.poppins(
  textStyle: const TextStyle(
    color: Colors.white,
    letterSpacing: .5,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  ),
);