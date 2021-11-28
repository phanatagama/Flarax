//User Model
class UserModel {
  final String uid;
  final String email;
  final String firstname;
  final String lastname;
  final String photoUrl;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.photoUrl});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'] ?? '',
      firstname: data['firstname'] ?? '',
      lastname: data['lastname'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "firstname": firstname, "lastname": lastname, "photoUrl": photoUrl};
}