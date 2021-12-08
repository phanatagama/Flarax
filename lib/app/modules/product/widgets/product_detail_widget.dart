import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flutter/material.dart';

Widget productDetail(BuildContext context, DocumentSnapshot? data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        color: Colors.black,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
        child: Center(
          child: data?["productPictureUrl"] == null
              ? Image.asset('assets/images/default.png')
              : Image.network(data?["productPictureUrl"]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data?["productStatus"]}",
                  // style: titleText20,
                ),
                const Icon(Icons.favorite_border),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${data?["productName"]}",
              // style: contentText18,
            ),
          ],
        ),
      ),
      const Divider(
        height: 5,
        thickness: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_sharp,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                '${data?["productProvince"]}, ${data?["productCity"]}',
                // style: contentText18,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            const Icon(
              Icons.category_rounded,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                '${data?["productCategory"]}',
                // style: contentText18,
              ),
            ),
          ],
        ),
      ),
      const Divider(
        height: 15,
        thickness: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Const.DESCRIPTION,
              // style: titleText20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${data?["productDescription"]}",
              // style: contentText18,
            ),
          ],
        ),
      ),
    ],
  );
}