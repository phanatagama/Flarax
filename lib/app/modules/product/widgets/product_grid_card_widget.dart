import 'package:cached_network_image/cached_network_image.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GridView productGridCard(List snapshot) {
  return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      children: snapshot
          .map((doc) => InkWell(
                onTap: () async {
                  var result = await Get.toNamed(Routes.DETAILPRODUCT,
                      arguments: doc.id);
                  if (result == true) {
                    FocusScope.of(Get.context!)
                        .requestFocus(ProductController.focusNode);
                  } else {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                              imageUrl: doc['productPictureUrl'],
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc['productName'],
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.w800),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: bluelightColor.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                doc['productStatus'],
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: blueColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.location_on_sharp,
                                  size: 16,
                                  color: Color(0xff0F9DED),
                                ),
                                Expanded(
                                  child: Text(
                                    '${doc['productProvince']}, ${doc['productCity']}',
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: blueColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList());
}
