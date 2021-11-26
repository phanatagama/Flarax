import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flarax/component/btn_gradient.dart';
import 'package:flarax/screens/auth/login_page.dart';
import 'package:flarax/theme/theme.dart';

class GetStarted extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 125, bottom: 19),
        child: Center(
          child: Text(
            "FLARAX",
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
          'Flarax merupakan aplikasi yang memberikan informasi mengenai barang bekas gratis yang masih layak dipakai',
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
            text: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            width: width - 208,
            border: BorderRadius.circular(50),
            proses: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}