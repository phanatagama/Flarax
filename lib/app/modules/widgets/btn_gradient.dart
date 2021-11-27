
import 'package:flarax/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class BtnGradient extends StatelessWidget{
  const BtnGradient({
    Key? key,
    required this.text,
    required this.width,
    required this.border,
    required this.onPressed
  }) : super(key: key);

  final String text;
  final width;
  final border;
  final onPressed;

  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            bluelightColor,
            blueColor,
          ]),
        borderRadius: border,
      ),
      child: Center(child: 
      Text(text,
        style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
      ),
    )),
    onTap: onPressed,
    )
    ;
  }
}
