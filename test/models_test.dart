import 'package:flarax/app/data/models/address_model.dart';
import 'package:flarax/app/data/models/product_model.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

var userResponse = {
  "uid": "L33t1337",
  "email": "root@gmail.com",
  "fullname": "root",
  "phoneNumber": "+6285156670181",
  "photoUrl":
      "https://www.gravatar.com/avatar/2fc2880ff4c97d37fa58608a16a4cd72.png?s=200&d=retro&r=pg",
  "chattingWith": null,
};

var addressResponse = {
  "uid": "L33t1337",
  "zipcode": "68121",
  "city": "Surabaya",
  "address": "jln. kalimantan 10 , tegalboto",
};

var productResponse = {
  "uid": "L33t1337",
  "productName": "Meja",
  "productDescription": "Meja Bekas terbuat dari kayu kalimantan",
  "productStatus": "Available",
  "productCategory": "Perlengkapan",
  "productPictureUrl":
      "https://firebasestorage.googleapis.com/v0/b/flarax-app.appspot.com/o/image_picker-1368171116.jpg?alt=media&token=260a9356-2712-41b0-a6bc-6d5ea7c0ca16",
  "productProvince": "Papua",
  "productCity": "Timika",
  "productAddress": "Jalan Buglax 5 Gang Mawar",
  "createdUpdatedAt": "2021-12-18T20:30:50.564753",
};

void main() {
  group('Testing JSON Parse', () {
    test('user object should have same value with expected', () {
      UserModel user = UserModel.fromMap(userResponse);
      expect(user.uid, "L33t1337");
      expect(user.email, "root@gmail.com");
      expect(user.fullname, "root");
      expect(user.phoneNumber, "+6285156670181");
      expect(user.chattingWith, null);
    });
    test('address object should have same value with expected', () {
      AddressModel address = AddressModel.fromMap(addressResponse);
      expect(address.uid, "L33t1337");
      expect(address.address, "jln. kalimantan 10 , tegalboto");
      expect(address.city, "Surabaya");
      expect(address.zipcode, "68121");
    });
    test('product object should have same value with expected', () {
      ProductModel product = ProductModel.fromJson(productResponse);
      expect(product.uid, "L33t1337");
      expect(product.productName, "Meja");
      expect(product.productStatus, "Available");
      expect(product.productCategory, "Perlengkapan");
      expect(product.productCity, "Timika");
      expect(product.productProvince, "Papua");
    });
  });
}
