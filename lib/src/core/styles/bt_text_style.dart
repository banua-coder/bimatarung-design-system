import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bimatarung_design_system.dart';

/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 14:25:58
/// @modify date 2023-04-12 14:25:58
/// @desc
class BTTextStyle {
  // This class should not be instantiated or extended.
  // This constructor prevents instatiations and extension.
  BTTextStyle._();

  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = 0.0,
    bool stripe = false,
    Color? color,
    double? height,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize * 1.sp,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing * 1.sp,
        height: height,
        textBaseline: TextBaseline.alphabetic,
        decoration: stripe ? TextDecoration.lineThrough : TextDecoration.none,
        locale: const Locale('en', 'US'),
        color: color,
      );

  static TextTheme mainTextTheme = TextTheme(
    displayLarge: BTTextStyle.title1(),
    displayMedium: BTTextStyle.title2(),
    displaySmall: BTTextStyle.title3(),
    titleLarge: BTTextStyle.title4(),
    titleMedium: BTTextStyle.heading(
      color: BTColors.textBody,
    ),
    titleSmall: BTTextStyle.subHeading(
      color: BTColors.textBody,
    ),
    labelLarge: BTTextStyle.body(),
    labelMedium: BTTextStyle.body(
      color: BTColors.textBody,
    ),
    labelSmall: BTTextStyle.bodySmall(),
    bodyLarge: BTTextStyle.subHeading(),
    bodyMedium: BTTextStyle.body(),
    bodySmall: BTTextStyle.bodySmall(
      color: BTColors.textSecondary,
    ),
  );

  // Title
  static TextStyle title1({Color? color}) => _base(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle title2({Color? color}) => _base(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle title3({Color? color}) => _base(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle title4({Color? color}) => _base(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Heading

  static TextStyle heading({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        fontSize: 18,
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle subHeading({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        fontSize: 16,
        color: color,
        fontWeight: fontWeight,
      );

// Body
  static TextStyle body({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontWeight: fontWeight,
      );

  static TextStyle bodySmall({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        fontSize: 12,
        color: color,
        fontWeight: fontWeight,
      );

  // Caption
  static TextStyle caption({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    bool stripe = false,
  }) =>
      _base(
        fontSize: 11,
        color: color,
        fontWeight: fontWeight,
        stripe: stripe,
      );

  // Note
  static TextStyle note({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        fontSize: 10,
        color: color,
        fontWeight: fontWeight,
      );

  // Number

  static TextStyle numberSmall({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        fontSize: 12,
        color: color,
        fontWeight: fontWeight,
      );
}
