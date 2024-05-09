import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


Widget customText(
    String data, {
      Color color=Colors.white,
      fontSize=18.0,fontStyle=FontStyle.normal,
      fontWeight=FontWeight.normal,
      textAlign =TextAlign.center,
      maxLines = 10,
      overflow =   TextOverflow.ellipsis
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
    maxLines: maxLines,
    overflow: overflow,
  );
}