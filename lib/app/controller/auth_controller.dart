import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/utils/gravatar.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/address_model.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rxn<User?> firebaseUser;
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  late Rxn<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rxn<User?>(auth.currentUser);
    googleSignInAccount = Rxn<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    //get user data from firestore
    if (user?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }

    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed(Routes.LOGIN);
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAllNamed(Routes.HOME);
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount?.id != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed(Routes.LOGIN);
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAllNamed(Routes.HOME);
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .get()
        .then(
            (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        firebaseUser.value = (await auth.signInWithCredential(credential)).user;
        if (firebaseUser.value != null) {
          final QuerySnapshot result = await firebaseFirestore
              .collection(Const.PATHUSERCOLLECTION)
              .where(Const.UID, isEqualTo: firebaseUser.value!.uid)
              .get();
          final List<DocumentSnapshot> documents = result.docs;
          if (documents.length == 0) {
            firebaseUser.value!.sendEmailVerification();
            UserModel _newUser = UserModel(
                uid: firebaseUser.value!.uid,
                email: firebaseUser.value!.email!,
                fullname: firebaseUser.value!.displayName!,
                phoneNumber: firebaseUser.value!.phoneNumber!,
                photoUrl: firebaseUser.value!.photoURL.toString(),
                chattingWith: null);
            _createUserFirestore(_newUser, firebaseUser.value!);

            AddressModel _newAddress = AddressModel(
              uid: firebaseUser.value!.uid,
              address: '',
              zipcode: '',
              city: '',
            );
            _createAddressFirestore(_newAddress, firebaseUser.value!);
          }
          final box = GetStorage();
          box.write(Const.UID, firebaseUser.value!.uid);
          box.write(Const.NAME, firebaseUser.value!.displayName);
          box.write(Const.photoURL, firebaseUser.value!.photoURL);
        }
        var document = await firebaseFirestore
            .collection(Const.PATHADDRESSCOLLECTION)
            .doc(auth.currentUser!.uid)
            .get();
        if (!document.exists) {}
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(
      {email, password, fullname, phoneNumber, zipcode, city, address}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        Gravatar gravatar = Gravatar(email);
        String gravatarUrl = gravatar.imageUrl(
          size: 200,
          defaultImage: GravatarImage.retro,
          rating: GravatarRating.pg,
          fileExtension: true,
        );
        auth.currentUser!.sendEmailVerification();
        //create the new user object
        UserModel _newUser = UserModel(
            uid: result.user!.uid,
            email: result.user!.email!,
            fullname: fullname,
            phoneNumber: phoneNumber,
            photoUrl: gravatarUrl);
        AddressModel _newAddress = AddressModel(
          uid: result.user!.uid,
          address: address,
          zipcode: zipcode,
          city: city,
        );
        _createUserFirestore(_newUser, result.user!);
        _createAddressFirestore(_newAddress, result.user!);
      });
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      // Get.snackbar("Failed", firebaseAuthException.toString());
      Get.snackbar(
        "Error",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    firebaseFirestore
        .collection(Const.PATHUSERCOLLECTION)
        .doc(_firebaseUser.uid)
        .set(user.toJson(), SetOptions(merge: true));
    update();
  }

  //create the firestore user in address collection
  void _createAddressFirestore(AddressModel address, User _firebaseUser) {
    firebaseFirestore
        .collection(Const.PATHADDRESSCOLLECTION)
        .doc(_firebaseUser.uid)
        .set(address.toJson(), SetOptions(merge: true));
    update();
  }

  void signOut() async {
    await auth.signOut();
    await googleSign.disconnect();
    await googleSign.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<bool> isLoggedIn() async {
    var user = await auth.currentUser;
    if (user == null) {
      return false;
    }
    return true;
  }
}
