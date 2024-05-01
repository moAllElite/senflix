import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'custom_color.dart';

Widget myAnimatedSmoothIndicator(int activedIndex,int counter,{Color color = isRed}){

  return  AnimatedSmoothIndicator(

    count: counter, // Replace count
    axisDirection: Axis.horizontal,
    effect:  ExpandingDotsEffect(
      expansionFactor: 2,
      dotHeight: 8,
      activeDotColor: color,
      dotColor: const Color.fromRGBO(100, 100, 111, 0.2),
    ), activeIndex: activedIndex,
  );
}
