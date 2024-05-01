import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatButton extends StatelessWidget{
  final String title;
  final Color color;
  final Function onPressed;
  const FlatButton({required this.title,required this.color,required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.zero,
        elevation: 5.0,
        child: MaterialButton(
          onPressed: ()  {
            onPressed();
          },
          minWidth: 500.0,
          height: 60.0,
          child: Text(
              title,
              style:GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  height: 1.2,
                  fontSize:25,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ),
        ),
      ),
    );
  }

}
