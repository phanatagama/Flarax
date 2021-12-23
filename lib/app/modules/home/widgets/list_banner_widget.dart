import 'package:flarax/app/core/values/constant.dart';
import 'package:flutter/material.dart';

final List<Widget> child = Const.BANNERLIST.map(
  (i) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          InkWell(
              onTap: () {
                print("you click } ");
              },
              child: Image.asset(i, fit: BoxFit.cover, width: 1000.0)),
        ]),
      ),
    );
  },
).toList();

// listproduct() {
//   ProductController.getLimitedProducts().then((snapshot) {
//     print(snapshot.docs[0]['productName']);
//   if (snapshot.docs.isNotEmpty){
//     return snapshot.docs;
//   }});
//   return [];
// }
