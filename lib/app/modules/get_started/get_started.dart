import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/core/values/styles.dart';
import 'package:flarax/app/modules/widgets/btn_gradient_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class GetStarted extends GetView{
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 125, bottom: 19),
        child: Center(
          child: Text(
            Const.FLARAX,
            style: titleTextStyle,
          ),
        ),
      );
    }
    Widget sliderGet(){
      return CarouselSlider(
        options: CarouselOptions(
          height: 229,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          pauseAutoPlayOnTouch: true,
        ),
        items: [1, 2, 3, 4].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset(
                  "assets/slider_get/slider$i.png",
                  width: 329,
                ),
              );
            },
          );
        }).toList(),
      );
    }

    Widget textGet() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          Const.APPDESCRIPTION,
          style: greyTextStyle.copyWith(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          sliderGet(),
          SizedBox(
            height: height / 20,
          ),
          textGet(),
          SizedBox(
            height: height / 10,
          ),
          BtnGradient(
            text: Const.GETSTARTED,
            width: width - 208,
            border: BorderRadius.circular(50),
            onPressed: () => Get.offNamed(Routes.LOGIN),
          ),
        ],
      ),
    );
  }
}