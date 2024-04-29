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
      dotHeight: 16,
      activeDotColor: color,
      dotColor: const Color.fromRGBO(100, 100, 111, 0.2),
    ), activeIndex: activedIndex,
  );
}

/*
Widget carouselIndicator(List myList, int currentPage, int length) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          width: i == currentPage ? 7 : 5,
          height: i == currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == currentPage ? isRed : isGrey, shape: BoxShape.circle),
        )
    ],
  );
}*/

