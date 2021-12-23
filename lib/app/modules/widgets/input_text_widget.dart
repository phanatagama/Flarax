import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.label,
      required this.hinttext,
      required this.iconInput,
      this.password = false,
      required this.width,
      required this.controller})
      : super(key: key);

  final String label;
  final String hinttext;
  final iconInput;
  final bool password;
  final width;
  final controller;

  @override
  Widget build(BuildContext context) {
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
              controller: controller,
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
