import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLightColor = Color(0xff39A552);
  static Color whiteColor = Colors.white;
  static Color grayColor = Colors.grey;
  static Color blackColor = Color(0xff303030);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlue = Color(0xff003E90);
  static Color pinkColor= Color(0xffED1E79);
  static Color brownColor= Color(0xffCF7E48);
  static Color blueColor= Color(0xff4882CF);
  static Color yellowColor= Color(0xffF2D352);
  static Color orangeColor=Colors.orange;





  static ThemeData lightTheme =ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35)
        )
      )
    ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: whiteColor,
            fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color:blackColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
        )
  )
  );
}