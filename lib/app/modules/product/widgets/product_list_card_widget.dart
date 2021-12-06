import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListView productListCard(List snapshot) {
  return ListView(
    padding: EdgeInsets.zero,
    children: snapshot
      .map((doc) => InkWell(
            onTap: () => Get.toNamed(Routes.DETAILPRODUCT, arguments: doc.id),
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
                            // style: contentText16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            doc['productStatus'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: contentText16,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_sharp,
                                size: 16,
                              ),
                              Text(
                                '${doc['productProvince']}, ${doc['productCity']}',
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