import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool layoutGrid = false.obs;
  RxString keyword = "".obs;
  final items = [].obs;
  final itemsAfterFilter = [].obs;
  final filterOptions = [].obs;

  selectFilter(bool isSelected, String category) {
    isSelected ? filterOptions.add(category) : filterOptions.remove(category);
    filterOptions.refresh();
  }

  bool isSelectFilter(String value) {
    return filterOptions.contains(value);
  }

  void filterProduct() {
      itemsAfterFilter.value = [];
      filterOptions.forEach((category) { 
        itemsAfterFilter.value += items.where((item) { 
          print(item["productCategory"].contains(category));
          return item["productCategory"].contains(category);
          }).toList();
        itemsAfterFilter.refresh();
      });

      if (filterOptions.isEmpty) {
      itemsAfterFilter.value = items.where((item) => item["productName"].toLowerCase().contains(keyword.toLowerCase())).toList();
      } else if (itemsAfterFilter.isNotEmpty) {
        itemsAfterFilter.value = itemsAfterFilter.where((item) => item["productName"].toLowerCase().contains(keyword.toLowerCase())).toList();
      }
      itemsAfterFilter.refresh();
  }

  static CollectionReference productCollection =
  firebaseFirestore.collection('products');

  static Future<void> updateProduct({
    required String productId,
    required String uid,
    required String productName,
    required String productDescription,
    required String productStatus,
    required String productCategory,
    required String productPictureUrl,
    required String productProvince,
    required String productCity,
    required String productAddress
  }) async {
    ProductModel product = ProductModel(
      uid: uid,
      productName: productName,
      productDescription: productDescription,
      productStatus: productStatus,
      productCategory: productCategory,
      productPictureUrl: productPictureUrl,
      productProvince: productProvince,
      productCity: productCity,
      productAddress: productAddress,
      createdUpdatedAt: DateTime.now().toIso8601String(),
    );
    await productCollection.doc(productId).update(product.toJson());
  }

  static Future<void> addProduct({
    required String productName,
    required String productDescription,
    required String productCategory,
    required String productPictureUrl,
    required String productProvince,
    required String productCity,
    required String productAddress
  }) async {
    ProductModel product = ProductModel(
        uid: auth.currentUser!.uid,
        productName: productName,
        productDescription: productDescription,
        productStatus: 'Available',
        productCategory: productCategory,
        productPictureUrl: productPictureUrl,
        productProvince: productProvince,
        productCity: productCity,
        productAddress: productAddress,
        createdUpdatedAt: DateTime.now().toIso8601String(),
    );
    await productCollection.add(product.toJson());
  }

  static Future<void> deleteProduct({
    required String productId,
  }) async {
    await productCollection.doc(productId).delete();
  }

  static Stream<QuerySnapshot> getAllProducts() {
    return productCollection.snapshots();
  }

  static Stream<QuerySnapshot> getAllUsersProducts(String uid) {
    return productCollection.where('uid', isEqualTo: uid)
        .snapshots();
  }

  static Stream<DocumentSnapshot> getProductDataWithId(String id) {
    return productCollection.doc(id).snapshots();
  }

  static Future<DocumentSnapshot> getProductDataWithIdFuture(String id) async {
    return await productCollection.doc(id).get();
  }

}