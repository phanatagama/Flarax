//User Model
class UserModel {
  final String uid;
  final String email;
  final String fullname;
  final String phoneNumber;
  final String photoUrl;
  final chattingWith;

  UserModel(
      {required this.uid,
      required this.email,
      required this.fullname,
      required this.phoneNumber,
      required this.photoUrl,
      this.chattingWith = null});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      fullname: data['fullname'],
      phoneNumber: data['phoneNumber'],
      photoUrl: data['photoUrl'],
      chattingWith: data['chattingWith'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "chattingWith": chattingWith,
      };
}
