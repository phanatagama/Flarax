import 'package:flarax/app/core/values/constant.dart';
import 'package:flutter/material.dart';

final List<Widget> child = 
  Const.BANNERLIST.map(
  (i) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          InkWell(
              onTap: () { print("you click } "); },
              child: Image.asset(i, fit: BoxFit.cover, width: 1000.0)),
          // Positioned(
          //   bottom: 0.0,
          //   left: 0.0,
          //   right: 0.0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
          //         begin: Alignment.bottomCenter,
          //         end: Alignment.topCenter,
          //       ),
          //     ),
          //     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          //     child: Text(
          //       'No. image',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  },
).toList();