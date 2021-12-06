//User Model
class UserModel {
  final String uid;
  final String email;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String photoUrl;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.photoUrl});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      phoneNumber: data['phoneNumber'],
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "firstname": firstname, "lastname": lastname,  "phoneNumber": phoneNumber, "photoUrl": photoUrl};
}