import 'package:flutter/material.dart';

class InputText extends StatelessWidget{
  const InputText({
    Key? key,
    required this.label,
    required this.hinttext,
    required this.iconInput,
    required this.password,
    required this.width,
  }) : super(key: key);

  final label;
  final hinttext;
  final iconInput;
  final password;
  final width;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black.withOpacity(0.87),
              fontSize: 14,
            ),
          ),
          Container(
            width: width,
            child: TextField(
              obscureText: password,
              decoration: InputDecoration(
                hintText: hinttext,
                suffixIcon: iconInput,
              ),
            ),
          ),
        ],
      ),
    );
  }
}