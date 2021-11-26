import 'package:flutter/material.dart';
import 'package:flarax/theme/theme.dart';

class TitleAuth extends StatelessWidget{
  const TitleAuth({
    Key? key,
    required this.title,
}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: bluelightColor,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0, 3.0),
              blurRadius: 9,
              color: Color.fromARGB(30, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
