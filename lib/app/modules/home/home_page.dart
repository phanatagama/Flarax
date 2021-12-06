import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/core/values/styles.dart';
import 'package:flarax/app/modules/home/widgets/menu_row_widget.dart';
import 'package:flarax/app/modules/widgets/background_widget.dart';
import 'package:flarax/app/modules/home/widgets/profile_tile_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetView {
  late Size deviceSize;
  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Obx(() => ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        image: NetworkImage(authController.firestoreUser.value?.photoUrl ?? Const.PHOTOURL),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        child: InkWell(onTap: (){})),
                      ),
                    ),),
                  Obx(() => new ProfileTile(
                    title: "Hi, ${authController.firestoreUser.value?.firstname} ${authController.firestoreUser.value?.lastname}",
                    subtitle: Const.WELCOME,
                    textColor: Colors.white,
                  ),),
                  new IconButton(
                    icon: new Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      authController.signOut();
                      },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: Const.HINTSEARCHPRODUCT),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  Widget actionMenuCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.solidUser,
                    firstLabel: Const.PROFILE,
                    firstIconCircleColor: Colors.blue,
                    firstOnPressed: () => Get.toNamed(Routes.PROFILE),
                    secondIcon: FontAwesomeIcons.userFriends,
                    secondLabel: Const.PRODUCTS,
                    secondOnPressed: () => Get.toNamed(Routes.PRODUCT),
                    secondIconCircleColor: Colors.orange,
                    thirdIcon: FontAwesomeIcons.mapMarkerAlt,
                    thirdLabel: Const.POSTING,
                    thirdIconCircleColor: Colors.purple,
                    thirdOnPressed: () => Get.toNamed(Routes.POSTPRODUCT),
                    fourthIcon: FontAwesomeIcons.locationArrow,
                    fourthLabel: "Moment",
                    fourthIconCircleColor: Colors.indigo,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.images,
                    firstLabel: "Albums",
                    firstIconCircleColor: Colors.red,
                    secondIcon: FontAwesomeIcons.solidHeart,
                    secondLabel: "Likes",
                    secondIconCircleColor: Colors.teal,
                    thirdIcon: FontAwesomeIcons.solidNewspaper,
                    thirdLabel: "Articles",
                    thirdIconCircleColor: Colors.lime,
                    fourthIcon: FontAwesomeIcons.solidCommentDots,
                    fourthLabel: "Reviews",
                    fourthIconCircleColor: Colors.amber,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.footballBall,
                    firstLabel: "Sports",
                    firstIconCircleColor: Colors.cyan,
                    secondIcon: FontAwesomeIcons.solidStar,
                    secondLabel: "Fav",
                    secondIconCircleColor: Colors.redAccent,
                    thirdIcon: FontAwesomeIcons.blogger,
                    thirdLabel: "Blogs",
                    thirdIconCircleColor: Colors.pink,
                    fourthIcon: FontAwesomeIcons.wallet,
                    fourthLabel: "Wallet",
                    fourthIconCircleColor: Colors.brown,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget balanceCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(fontFamily: ralewayFont),
                    ),
                    Material(
                      color: Colors.black,
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "500 Points",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: ralewayFont),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "₹ 1000",
                  style: TextStyle(
                      fontFamily: ralewayFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
        ),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            searchCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            // balanceCard(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Background(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }
}