//Address Model
class AddressModel {
  final String uid;
  final String address;
  final String zipcode;
  final String city;

  AddressModel(
      {required this.uid,
      required this.address,
      required this.zipcode,
      required this.city});

  factory AddressModel.fromMap(Map data) {
    return AddressModel(
      uid: data['uid'],
      address: data['address'] ?? '',
      zipcode: data['zipcode'] ?? '',
      city: data['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "address": address, "zipcode": zipcode, "city": city};
}