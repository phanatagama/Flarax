import 'dart:convert';

ProductModel userFromJson(String str) => ProductModel.fromJson(json.decode(str));

String userToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel{
  ProductModel({
    required this.uid,
    required this.productName,
    required this.productDescription,
    required this.productStatus,
    required this.productCategory,
    required this.productPictureUrl,
    required this.productProvince,
    required this.productCity,
    required this.productAddress,
    required this.createdUpdatedAt,
  });

  String uid;
  String productName;
  String productDescription;
  String productStatus;
  String productCategory;
  String productPictureUrl;
  String productProvince;
  String productCity;
  String productAddress;
  String createdUpdatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    uid: json["uid"],
    productName: json["productName"],
    productDescription: json["productDescription"],
    productStatus: json["productStatus"],
    productCategory: json["productCategory"],
    productPictureUrl: json["productPictureUrl"],
    productProvince: json["productProvince"],
    productCity: json["productCity"],
    productAddress: json["productAddress"],
    createdUpdatedAt: json["createdUpdatedAt"],
  );

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      uid: data["uid"],
      productName: data["productName"],
      productDescription: data["productDescription"],
      productStatus: data["productStatus"],
      productCategory: data["productCategory"],
      productPictureUrl: data["productPictureUrl"],
      productProvince: data["productProvince"],
      productCity: data["productCity"],
      productAddress: data["productAddress"],
      createdUpdatedAt: data["createdUpdatedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "productName": productName,
    "productDescription": productDescription,
    "productStatus": productStatus,
    "productCategory": productCategory,
    "productPictureUrl": productPictureUrl,
    "productProvince": productProvince,
    "productCity": productCity,
    "productAddress": productAddress,
    "createdUpdatedAt": createdUpdatedAt,
  };
}