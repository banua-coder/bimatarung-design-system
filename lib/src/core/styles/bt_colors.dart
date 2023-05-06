/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 13:10:29
/// @modify date 2023-04-12 13:10:29
/// @desc
import 'package:flutter/material.dart';

class BTColors {
  static const Color primary = Color(0xFF030F6B);
  static const Color primaryDarker = Color(0xFF1E004E);
  static const Color primaryLighter = Color(0xFFECEEFF);
  static const Color primarySurface = Color(0xFFCCCAD7);
  static const Color primaryBorder = Color(0xFFCAEFF0);
  static const Color secondary = Color(0xFF2AC7D1);
  static const Color secondarySurface = Color(0xFFECF8FE);
  static const Color secondaryBorder = Color(0xFFC4DAFA);
  static const Color secondaryDarker = Color(0xFF054A80);

  // Neutral
  static const Color neutral10 = Color(0xFFFFFFFF);
  static const Color neutral20 = Color(0xFFF7F9FA);
  static const Color neutral30 = Color(0xFFF2F4F5);
  static const Color neutral40 = Color(0xFFE3E5E5);
  static const Color neutral50 = Color(0xFFCDCFD0);
  static const Color neutral60 = Color(0xFF979C9E);
  static const Color neutral70 = Color(0xFF72777A);
  static const Color neutral80 = Color(0xFF6C7072);
  static const Color neutral90 = Color(0xFF404446);
  static const Color neutral100 = Color(0xFF090A0A);

  // Semantic
  static const Color success = Color(0xFF12B76A);
  static const Color successDarker = Color(0xFF219653);
  static const Color error = Color(0xFFFF5247);
  static const Color errorDarker = Color(0xFFB42318);
  static const Color warning = Color(0xFFFF9400);
  static const Color warningDarker = Color(0xFFDC6803);

  static const Color badge = Color(0xFFFF5247);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF030F6B,
    <int, Color>{
      50: Color(0xFFCCE4DE),
      100: Color(0xFF99C5C7),
      200: Color(0xFF6693A9),
      300: Color(0xFF33568B),
      400: Color(0xFF030F6B),
      500: Color(0xFF070162),
      600: Color(0xFF140058),
      700: Color(0xFF1E004E),
      800: Color(0xFF260044),
      900: Color(0xFF290039),
    },
  );

  // Text
  static const Color textPrimary = neutral10;
  static const Color textPrimaryBlack = neutral100;
  static const Color textSecondary = neutral80;
  static const Color textOnBoardingCaption = Color(0xFFC6C6C6);
  static const Color textInactive = neutral50;
  static const Color textPlaceholder = neutral60;
  static const Color textBody = neutral90;
  static const Color textMain = primary;
  static const Color textDarkBlue = secondaryDarker;
  static const Color textPrice = warning;
  static const Color textWaitingState = Color(0xFFB54708);
  static const Color textError = error;
  static const Color appBarShadow = Color(0xFF141414);

  // Checkbox
  static const Color radioActive = success;

  // Background
  static const Color bgDefault = neutral10;
  static const Color bgSecondary = neutral20;
  static const Color bgError = Color(0xFFFEF3F2);
  static const Color bgSuccess = Color(0xFFC0F1D4);
  static const Color bgWarning = Color(0xFFFFFAEB);
  static const Color bgInfoChip = neutral80;

  // Border
  static const Color borderDefault = neutral40;
  static const Color borderInput = neutral50;
  static const Color borderSuccess = Color(0xFFD1FADF);
  static const Color borderError = Color(0xFFFFCDCA);
}
