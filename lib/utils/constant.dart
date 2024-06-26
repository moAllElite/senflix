import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_color.dart';
var kButtonStyle = const ButtonStyle(
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


var kTextStyle =  GoogleFonts.poppins(
  textStyle: const TextStyle(
    color: Colors.white,
    letterSpacing: .5,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  ),
);


var kTextFieldFormDecoration = const InputDecoration(
  errorStyle: TextStyle(
    color: isRed,
    fontSize: 12.0,
  ),
  hintText: 'Entrer votre email',
  filled: true,
  fillColor: Colors.white,
  focusColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: isGrey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: isGrey,
    ),
  ),
);

var kTextFieldRecommandationDecoration = const InputDecoration(
  errorStyle: TextStyle(
    color: isRed,
    fontSize: 12.0,
  ),
  hintText: 'Entrer votre email',
  filled: true,
  fillColor: isGrey,
  iconColor: Colors.white,
  focusColor: isGrey,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: isGrey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: isGrey,
    ),
  ),
);

const netflixSvg =  '''
    <svg height="2500" viewBox="66.827 90.186 451.865 819.903" width="1464" xmlns="http://www.w3.org/2000/svg"><g clip-rule="evenodd" fill-rule="evenodd"><path d="m66.827 90.294v409.464c0 225.219.214 409.683.539 410.007.324.324 14.239-1.076 31.067-2.912 16.828-1.833 40.019-4.203 51.562-5.175 17.69-1.509 70.762-4.85 76.804-4.958 1.833 0 1.94-9.163 2.157-173.468l.322-173.062-.106-.299v.216z" fill="#b1060f"/><path d="m66.827 90.294 162.265 553.358.184-93.461-.106-.298v.215z" fill="#9d030f"/><path d="m357.535 90.834-.324 181.122-.323 181.016 160.94 456.686c-.092.092-.518.139-1.213.148.804 0 1.302-.047 1.429-.148.54-.433.648-184.789.54-409.792l-.324-409.032z" fill="#b1060f"/><path d="m356.888 452.972 154.06 437.165-153.889-528.716z" fill="#9d030f"/><path d="m66.827 90.294 162.343 459.814v-.216l12.837 36.226c71.302 201.714 109.595 309.955 109.811 310.171.108.107 10.896.756 23.946 1.4 39.481 1.94 88.452 6.146 125.669 10.78 8.521 1.08 15.964 1.62 16.396 1.188l-160.94-456.688v.108l-14.889-42.044c-14.563-41.077-24.27-68.569-82.843-233.951-15.748-44.526-29.125-82.152-29.663-83.877l-1.08-3.019h-80.794z" fill="#e50914"/></g></svg>
    ''';

const netflixIconSvg =  '''
    <svg height="70" viewBox="66.827 90.186 451.865 819.903" width="65" xmlns="http://www.w3.org/2000/svg"><g clip-rule="evenodd" fill-rule="evenodd"><path d="m66.827 90.294v409.464c0 225.219.214 409.683.539 410.007.324.324 14.239-1.076 31.067-2.912 16.828-1.833 40.019-4.203 51.562-5.175 17.69-1.509 70.762-4.85 76.804-4.958 1.833 0 1.94-9.163 2.157-173.468l.322-173.062-.106-.299v.216z" fill="#b1060f"/><path d="m66.827 90.294 162.265 553.358.184-93.461-.106-.298v.215z" fill="#9d030f"/><path d="m357.535 90.834-.324 181.122-.323 181.016 160.94 456.686c-.092.092-.518.139-1.213.148.804 0 1.302-.047 1.429-.148.54-.433.648-184.789.54-409.792l-.324-409.032z" fill="#b1060f"/><path d="m356.888 452.972 154.06 437.165-153.889-528.716z" fill="#9d030f"/><path d="m66.827 90.294 162.343 459.814v-.216l12.837 36.226c71.302 201.714 109.595 309.955 109.811 310.171.108.107 10.896.756 23.946 1.4 39.481 1.94 88.452 6.146 125.669 10.78 8.521 1.08 15.964 1.62 16.396 1.188l-160.94-456.688v.108l-14.889-42.044c-14.563-41.077-24.27-68.569-82.843-233.951-15.748-44.526-29.125-82.152-29.663-83.877l-1.08-3.019h-80.794z" fill="#e50914"/></g></svg>
    ''';


var netflixLogo =  SvgPicture.string(
    netflixSvg,
    width: 65,
    height: 65,
);

var netflixAppBarIcon =  SvgPicture.string(
  netflixIconSvg,
  width: 15,
  height: 15,
);

