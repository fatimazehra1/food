import 'package:flutter/material.dart';

class AppColors{
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color secondaryColor = const Color.fromRGBO(255, 225, 206, 1);
  static Color titleColor = const Color.fromRGBO(50, 52, 62, 1);
  static Color textColor = const Color.fromRGBO(100, 105, 130, 1);
  static Color whiteColor = const Color.fromARGB(255, 255, 255, 255);
  static Color buttonColor = const Color.fromRGBO(209, 56, 49, 1);
  static Color greyColor = const Color.fromRGBO(18, 18, 35, 1);
  //----------------
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}
ThemeData primaryTheme = ThemeData(
  //seed
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor
  ),

  textTheme : TextTheme (
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 15,
        // letterSpacing: 1,
        
      ),
      headlineMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        // letterSpacing: 2,
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: AppColors.titleColor,
        fontSize: 13,
        fontWeight: FontWeight.w200
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14
      )
    ),








  //scaffold color 
  // scaffoldBackgroundColor: AppColors.secondaryAccent,

  //app bar theme color
  // appBarTheme: AppBarTheme(
  //   backgroundColor: AppColors.secondaryColor,
  //   foregroundColor: AppColors.textColor,
  //   surfaceTintColor: Colors.transparent,
  //   centerTitle: true
  // ),

    // //card theme 
    // cardTheme: CardTheme(
    //   color: AppColors.secondaryColor.withOpacity(0.5),
    //   surfaceTintColor: Colors.transparent,
    //   shape: const RoundedRectangleBorder(),
    //   shadowColor: Colors.transparent,
    //   margin: const EdgeInsets.only(bottom: 16)
    // ),

    // //input decoration theme 
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.secondaryColor.withOpacity(0.5),
    //   border: InputBorder.none,
    //   labelStyle: TextStyle(color: AppColors.textColor),
    //   prefixIconColor: AppColors.textColor
    // ),

    // //dialoge theme 
    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.secondaryAccent,
    //   surfaceTintColor: Colors.transparent,

    // )
);