import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  const Body({
    Key? key,
    required this.child,
}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 63, left: 20, right: 20),
          child: child,
        ),
      ),
    );
  }
}