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
    fontFamily: 'Cairo',
    textTheme: CustomTextTheme.textTheme(),
    unselectedWidgetColor: AppColor.orangeColor,
    hintColor: AppColor.tiffanyColor,
    indicatorColor: AppColor.tiffanyColor,
    scaffoldBackgroundColor: AppColor.greyBackgroundColor,
    iconTheme: IconThemeData(
      color: AppColor.tiffanyColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w500,
        color: AppColor.whiteColor,
        fontSize: 16,
      ),
      disabledBackgroundColor: AppColor.greyTextColor,
      disabledForegroundColor: AppColor.whiteColor,
      minimumSize: const Size(398, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: AppColor.greyTextColor,
    )),
  );
}
