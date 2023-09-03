import 'package:flarax/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle greyTextStyle = GoogleFonts.tajawal(
  color: greyColor,
  fontWeight: FontWeight.w400,
);

TextStyle robotStyle = GoogleFonts.roboto(
  fontSize: 14,
);

TextStyle titleTextStyle = GoogleFonts.robotoSlab(
  fontSize: 34,
  color: titleColor,
);

const ralewayFont = "Raleway";

final myTextTheme = TextTheme(
  headline1: GoogleFonts.nunitoSans(
      fontSize: 105, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.nunitoSans(
      fontSize: 66, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.nunitoSans(fontSize: 52, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.nunitoSans(
      fontSize: 37, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.nunitoSans(fontSize: 26, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.nunitoSans(
      fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.nunitoSans(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.nunitoSans(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.roboto(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
