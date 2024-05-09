import 'package:flutter/material.dart';
import 'custom_text.dart';

class FlatButton extends StatelessWidget{
  final Color buttonColor;
  final Function onPressed;
  final String text;
  final IconData? iconData;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const FlatButton(
      this.iconData,{
        required this.text,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    required this.buttonColor,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.zero,
        elevation: 5.0,
        child: MaterialButton(
          onPressed: ()  {
            onPressed();
          },
          minWidth: 700.0,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child:    Icon(
                  iconData,
                  size: 25.0,
                  color:textColor,
                ),
              ),
              customText(
                  text,
                  color:textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight
              ),
            ],
          ),
        ),
      ),
    );
  }

}
