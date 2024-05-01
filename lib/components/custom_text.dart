import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


Widget customText(
    String data, {
      color=Colors.white,
      fontSize=18.0,fontStyle=FontStyle.normal,
      fontWeight=FontWeight.normal,
      textAlign =TextAlign.center
    }
    ) {
  return Text(
    data,
    textAlign: textAlign,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
          letterSpacing: .5,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
    ),
  );
}