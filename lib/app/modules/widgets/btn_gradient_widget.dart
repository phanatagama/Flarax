import 'package:flutter/material.dart';

class BtnGradient extends StatelessWidget {
  const BtnGradient(
      {Key? key,
      required this.text,
      required this.width,
      required this.border,
      required this.onPressed})
      : super(key: key);

  final String text;
  final width;
  final border;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ElevatedButton(
      onPressed: onPressed,
      child: Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: border,
          ),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
    ));
  }
}
