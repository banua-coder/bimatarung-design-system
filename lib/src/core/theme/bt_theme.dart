/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 14:10:40
/// @modify date 2023-04-12 14:10:40
/// @desc 'Default Theme class for caretaker'

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../bimatarung_design_system.dart';

class BTTHeme {
  static ThemeData main() => ThemeData(
        primaryColor: BTColors.primary,
        primarySwatch: BTColors.primarySwatch,
        scaffoldBackgroundColor: BTColors.bgDefault,
        unselectedWidgetColor: BTColors.textInactive,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: BTColors.primary.withOpacity(0.6),
          selectionColor: BTColors.primary.withOpacity(0.5),
          selectionHandleColor: BTColors.primary,
        ),
        textTheme: BTTextStyle.mainTextTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: BTColors.bgDefault,
          foregroundColor: BTColors.textPrimaryBlack,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          centerTitle: false,
          elevation: 0,
          toolbarTextStyle: BTTextStyle.heading(),
        ),
        dividerColor: BTColors.neutral40,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        buttonTheme: BTButtonStyle.main(),
        filledButtonTheme: FilledButtonThemeData(
          style: BTButtonStyle.primary(),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: BTButtonStyle.outline(),
        ),
        textButtonTheme: TextButtonThemeData(
          style: BTButtonStyle.text(),
        ),
      );
}
