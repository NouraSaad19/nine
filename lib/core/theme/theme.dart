import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/theme/text_theme.dart';
import 'app_colors.dart';

class ThemeApp {
  ThemeApp._();
  static final lightTheme = lightThemeData();
}

ThemeData lightThemeData() {
  return ThemeData(
    canvasColor: Colors.transparent,
    dividerColor: Colors.transparent,
    fontFamily: 'cairo',
    textTheme: CustomTextTheme.textTheme(),
    unselectedWidgetColor: AppColor.orangeColor,
    hintColor: AppColor.tiffanyColor,
    indicatorColor: AppColor.tiffanyColor,
    scaffoldBackgroundColor: AppColor.greyBackgroundColor,
    iconTheme: IconThemeData(
      color: AppColor.tiffanyColor,
    ),

    //AppBarTheme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColor.blackColor,
        )),
    //ElevatedButtonThemeData
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontFamily: 'cairo',
        fontWeight: FontWeight.w500,
        color: AppColor.whiteColor,
        fontSize: 24,
      ),
      disabledBackgroundColor: AppColor.tiffanyColor,
      disabledForegroundColor: AppColor.tiffanyColor,
      minimumSize: const Size(398, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 0.0,
      backgroundColor: AppColor.orangeColor,
    )),

    inputDecorationTheme: InputDecorationTheme(
   
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
      fillColor: AppColor.greyColor.shade200,
      prefixIconColor: AppColor.tiffanyColor,
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 1, color: AppColor.tiffanyColor)),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      filled: true,
    ),

    //TextButtonThemeData
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        disabledBackgroundColor: AppColor.tiffanyColor,
        foregroundColor: AppColor.tiffanyColor,
      ),
    ),
    //RadioThemeData
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
        AppColor.blackColor,
      ),
      splashRadius: 20,
    ),
    //OutlinedButtonThemeData
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: AppColor.blackColor,
      textStyle: TextStyle(
        fontFamily: 'cairo',
        fontWeight: FontWeight.w300,
        color: AppColor.blackColor,
        fontSize: 16,
      ),
      side: BorderSide(
        color: AppColor.blackColor,
      ),
      disabledBackgroundColor: AppColor.blackColor,
      minimumSize: const Size(380, 37),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0.0,
      backgroundColor: AppColor.tiffanyColor,
    )),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      checkColor: MaterialStateProperty.all(AppColor.orangeColor),
      fillColor: MaterialStateProperty.all(Colors.transparent),
    ),
    //TextSelectionThemeData
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.greyColor,
    ),

    snackBarTheme: SnackBarThemeData(
        actionTextColor: AppColor.whiteColor,
        backgroundColor: AppColor.whiteColor,
        contentTextStyle: TextStyle(color: AppColor.whiteColor),
        elevation: 20),
  );
}
