import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class CustomTextTheme {
  static TextTheme textTheme() {
    const FontWeight bold = FontWeight.w700;
    const FontWeight regular = FontWeight.w300;
    return TextTheme(
      headlineLarge: GoogleFonts.cairo(
          color: AppColor.orangeColor, fontSize: 20, fontWeight: bold),
      headlineMedium: GoogleFonts.cairo(
        color: AppColor.orangeColor,
        fontSize: 16,
        fontWeight: regular,
      ),
      headlineSmall: GoogleFonts.cairo(
        color: AppColor.orangeColor,
        fontSize: 12,
        fontWeight: regular,
      ),
      labelLarge: GoogleFonts.cairo(
        color: AppColor.tiffanyColor,
        fontSize: 24,
        fontWeight: regular,
      ),
      labelMedium: GoogleFonts.cairo(
          color: AppColor.tiffanyColor, fontSize: 16, fontWeight: regular),
      labelSmall: GoogleFonts.cairo(
        color: AppColor.tiffanyColor,
        fontSize: 12,
        fontWeight: regular,
      ),
      displayLarge: GoogleFonts.cairo(
        color: AppColor.whiteColor,
        fontSize: 20,
        fontWeight: bold,
      ),
      displayMedium: GoogleFonts.cairo(
        color: AppColor.whiteColor,
        fontSize: 16,
        fontWeight: bold,
      ),
      displaySmall: GoogleFonts.cairo(
        color: AppColor.whiteColor,
        fontSize: 12,
        fontWeight: regular,
      ),
      bodyLarge: GoogleFonts.cairo(
        color: AppColor.greyTextColor,
        fontSize: 16,
        fontWeight: regular,
      ),
      bodyMedium: GoogleFonts.cairo(
        color: AppColor.greyTextColor,
        fontSize: 14,
        fontWeight: regular,
      ),
      bodySmall: GoogleFonts.cairo(
        color: AppColor.greyTextColor,
        fontSize: 12,
        fontWeight: regular,
      ),
    );
  }
}
