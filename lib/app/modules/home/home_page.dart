import 'package:carousel_slider/carousel_slider.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/home/controller/home_controller.dart';
import 'package:flarax/app/modules/home/widgets/list_banner_widget.dart';
import 'package:flarax/app/modules/home/widgets/menu_row_widget.dart';
import 'package:flarax/app/modules/widgets/background_widget.dart';
import 'package:flarax/app/modules/home/widgets/profile_tile_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
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
                    title: "Hi, ${authController.firestoreUser.value?.fullname}",
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
                    onTap: () => Get.toNamed(Routes.PRODUCT),
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
                    firstIconCircleColor: blueColor,
                    firstOnPressed: () => Get.toNamed(Routes.PROFILE),
                    secondIcon: FontAwesomeIcons.box,
                    secondLabel: Const.PRODUCTS,
                    secondOnPressed: () => Get.toNamed(Routes.PRODUCT),
                    secondIconCircleColor: greenColor,
                    thirdIcon: FontAwesomeIcons.plus,
                    thirdLabel: Const.POSTING,
                    thirdIconCircleColor: greyColor,
                    thirdOnPressed: () => Get.toNamed(Routes.POSTPRODUCT),
                    fourthIcon: FontAwesomeIcons.locationArrow,
                    fourthLabel: "My Product",
                    fourthIconCircleColor: Colors.indigo,
                  ),
                  // DashboardMenuRow(
                  //   firstIcon: FontAwesomeIcons.images,
                  //   firstLabel: "Albums",
                  //   firstIconCircleColor: Colors.red,
                  //   secondIcon: FontAwesomeIcons.solidHeart,
                  //   secondLabel: "Likes",
                  //   secondIconCircleColor: Colors.teal,
                  //   thirdIcon: FontAwesomeIcons.solidNewspaper,
                  //   thirdLabel: "Articles",
                  //   thirdIconCircleColor: Colors.lime,
                  //   fourthIcon: FontAwesomeIcons.solidCommentDots,
                  //   fourthLabel: "Reviews",
                  //   fourthIconCircleColor: Colors.amber,
                  // ),
                  // DashboardMenuRow(
                  //   firstIcon: FontAwesomeIcons.footballBall,
                  //   firstLabel: "Sports",
                  //   firstIconCircleColor: Colors.cyan,
                  //   secondIcon: FontAwesomeIcons.solidStar,
                  //   secondLabel: "Fav",
                  //   secondIconCircleColor: Colors.redAccent,
                  //   thirdIcon: FontAwesomeIcons.blogger,
                  //   thirdLabel: "Blogs",
                  //   thirdIconCircleColor: Colors.pink,
                  //   fourthIcon: FontAwesomeIcons.wallet,
                  //   fourthLabel: "Wallet",
                  //   fourthIconCircleColor: Colors.brown,
                  // ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget bannerImage() => Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            controller.current.value = index;
          }
        ),
        items: child,
        carouselController: controller.buttonCarouselController,
        
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Const.BANNERLIST.asMap().map(
          (index, url) {
            return MapEntry(index,Obx(() => Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.current == index
                      ? blueColor
                      : bluelightColor),
            )));
          },).values.toList(),
      ),
    ]);

  Widget bannerCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: blueColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Const.CARDTITLE,
                      style: Theme.of(Get.context!).textTheme.caption!.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 8,),
                   Text(
                  Const.CARDBODY,
                  style: Theme.of(Get.context!).textTheme.overline!.copyWith(color: Colors.white),
                )
                  ],
                ),
                Material(
                      color: Colors.white,
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Const.CONTINUE,
                          style: Theme.of(Get.context!).textTheme.button!.copyWith(color: blueColor),
                      ),
                    ),)
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
            bannerCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            bannerImage(),
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