import 'package:flarax/screens/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flarax',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: GetStarted(),
    );
  }
}
