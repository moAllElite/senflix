import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_color.dart';

 Widget carouselIndicator(List myList,int  currentPage){

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for(int i=0 ; i<myList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          width: i == currentPage  ? 7 : 5,
          height: i == currentPage ? 7 : 5,
          decoration:  BoxDecoration(
              color: i == currentPage? isRed : isGrey,
              shape: BoxShape.circle
          ),
        )
    ],
  ) ;
}