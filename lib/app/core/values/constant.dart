import 'package:flarax/app/data/models/product_model.dart';
import 'package:flarax/app/data/models/user_model.dart';

class Const {
  static const PHOTOURL =
      "https://getstamped.co.uk/wp-content/uploads/WebsiteAssets/Placeholder.jpg";
  static const photoURL = "PHOTOURL";
  static const NOTFOUNDANIMATE = "assets/animate/4339-not-found.json";
  static const NOTINTERNETANIMATE =
      "assets/animate/12701-no-internet-connection.json";
  static const DELETE = "DELETE";
  static const UPDATE = "UPDATE";
  static const ERROR = "ERROR";
  static const OWNER = "OWNER";
  static const ONBOARD = "onBoard";
  static const CONTACT = "CONTACT";
  static const SEARCHCONTACT =
      "Search nickname (you have to type exactly string)";
  static const CHAT = "CHAT";
  static const IMAGE = "IMAGE";
  static const CARDTITLE = "DAPATKAN PRODUK BAGUS";
  static const CARDBODY = "Cari produk sesuai kebutuhan";
  static const CONTINUE = "CONTINUE";
  static const CHATTINGWITH = "chattingWith";
  static const UID = "uid";
  static const PATHUSERCOLLECTION = "users";
  static const PATHADDRESSCOLLECTION = "address";
  static const PATHMESSAGECOLLECTION = "messages";
  static const MESSAGE = "Message";
  static const TIMESTAMP = "timestamp";
  static const EDIT = "EDIT";
  static const TYPE = "type";
  static const IDFROM = "idFrom";
  static const IDTO = "idTo";
  static const CONTENT = "content";
  static const SAVE = "SAVE";
  static const CANCEL = "CANCEL";
  static const BACK = "BACK";
  static const FLARAX = "FLARAX";
  static const GETSTARTED = "Get Started";
  static const PROFILE = "Profile";
  static const PRODUCTS = "Products";
  static const POSTING = "Posting";
  static const HINTSEARCHPRODUCT = "Find our product";
  static const HINTEMAIL = "johndoe@gmail.com";
  static const HINTPHONE = "+6281xxxxxxxx";
  static const WELCOME = "Welcome to the Flarax App";
  static const DESCRIPTION = "Description";
  static const APPDESCRIPTION =
      "Flarax merupakan aplikasi yang memberikan informasi mengenai barang bekas gratis yang masih layak dipakai";
  static const PROVINCE = "Province";
  static const CITY = "City";
  static const ADDRESS = "Address";
  static const PHONE = "Phone Number";
  static const CATEGORY = "Category";
  static const NAME = "Name";
  static const LOREM = "Lorem ipsum";
  static const EMPTY = "Empty";
  static const EMAIL = "Email Address";
  static const FULLNAME = "Full Name";
  static const FIRSTNAME = "First Name";
  static const LASTNAME = "Last Name";
  static const ZIPCODE = "Zip Code";
  static const REGISTER = "Register";
  static const LOGIN = "Login";
  static const PASSWORD = "Password";
  static const SIGNIN = "Sign In";
  static const GOOGLESIGNIN = "Sign with Google";
  static const CREATEONE = "Create one";
  static const ALLPRODUCT = "Lihat Semua";
  static const HAVEACCOUNT = "Already have an Account ? ";
  static const DONTHAVEACCOUNT = "Don’t have an Account ? ";
  static const CHOOSECATEGORY = "Please choose a category";
  static ProductModel productDummy = ProductModel.fromMap({
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
  });
  static UserModel userDummy = UserModel(
      uid: 'xxx',
      email: HINTEMAIL,
      fullname: FULLNAME,
      phoneNumber: HINTPHONE,
      photoUrl: PHOTOURL);
  static const BANNERLIST = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];
  static const CATEGORYPRODUCT = [
    "Fashion",
    "Electronic",
    "Dapur",
    "Buku",
    "Gaming",
    "Kesehatan",
    "Kecantikan",
    "Mainan",
    "Olahraga",
    "Otomotif",
    "Rumah Tangga",
    "Pertukangan",
    "Perlengkapan"
  ];
}
