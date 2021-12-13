
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListView productListCard( List snapshot) {
  return ListView(
    padding: EdgeInsets.zero,
    children: snapshot
      .map((doc) => InkWell(
            onTap: () async { 
              var result = await Get.toNamed(Routes.DETAILPRODUCT, arguments: doc.id);
              if (result == true){
                FocusScope.of(Get.context!).requestFocus(ProductController.focusNode);
              }else {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      doc['productPictureUrl'],
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            doc['productName'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(Get.context!).textTheme.headline6!.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bluelightColor.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                          doc['productStatus'],
                          style: Theme.of(Get.context!).textTheme.caption!.copyWith(fontWeight: FontWeight.bold, color: blueColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),)
                        ,
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_sharp,
                                size: 16,
                                color: Color(0xff0F9DED)
                              ),
                              Text(
                                '${doc['productProvince']}, ${doc['productCity']}',
                                style: Theme.of(Get.context!).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold, color: blueColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
      .toList());
}