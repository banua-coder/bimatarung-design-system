/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 16:12:03
/// @modify date 2023-04-12 16:12:03
/// @desc

import 'package:flutter/material.dart';

import '../styles/bt_colors.dart';

@immutable
class BTThemeColor extends ThemeExtension<BTThemeColor> {
  final Color? primary;
  final Color? primaryDarker;
  final Color? primaryLighter;
  final Color? primarySurface;
  final Color? primaryBorder;
  final Color? secondary;
  final Color? secondarySurface;
  final Color? secondaryBorder;
  final Color? secondaryDarker;
  final Color? neutral10;
  final Color? neutral20;
  final Color? neutral30;
  final Color? neutral40;
  final Color? neutral50;
  final Color? neutral60;
  final Color? neutral70;
  final Color? neutral80;
  final Color? neutral90;
  final Color? neutral100;
  final Color? success;
  final Color? successDarker;
  final Color? error;
  final Color? errorDarker;
  final Color? warning;
  final Color? warningDarker;
  final Color? badge;
  final Color? textPrimary;
  final Color? textPrimaryBlack;
  final Color? textSecondary;
  final Color? textOnBoardingCaption;
  final Color? textInactive;
  final Color? textPlaceholder;
  final Color? textBody;
  final Color? textMain;
  final Color? textDarkBlue;
  final Color? textPrice;
  final Color? textWaitingState;
  final Color? textError;
  final Color? radioActive;
  final Color? bgDefault;
  final Color? bgSecondary;
  final Color? bgMain;
  final Color? bgError;
  final Color? bgSuccess;
  final Color? bgWarning;
  final Color? bgInfoChip;
  final Color? borderDefault;
  final Color? borderInput;
  final Color? borderSuccess;
  final Color? borderError;

  const BTThemeColor({
    this.primary,
    this.primaryDarker,
    this.primaryLighter,
    this.primarySurface,
    this.primaryBorder,
    this.secondary,
    this.secondarySurface,
    this.secondaryBorder,
    this.secondaryDarker,
    this.neutral10,
    this.neutral20,
    this.neutral30,
    this.neutral40,
    this.neutral50,
    this.neutral60,
    this.neutral70,
    this.neutral80,
    this.neutral90,
    this.neutral100,
    this.success,
    this.successDarker,
    this.error,
    this.errorDarker,
    this.warning,
    this.warningDarker,
    this.badge,
    this.textPrimary,
    this.textPrimaryBlack,
    this.textSecondary,
    this.textOnBoardingCaption,
    this.textInactive,
    this.textPlaceholder,
    this.textBody,
    this.textMain,
    this.textDarkBlue,
    this.textPrice,
    this.textWaitingState,
    this.textError,
    this.radioActive,
    this.bgDefault,
    this.bgSecondary,
    this.bgMain,
    this.bgError,
    this.bgSuccess,
    this.bgWarning,
    this.bgInfoChip,
    this.borderDefault,
    this.borderInput,
    this.borderSuccess,
    this.borderError,
  });

  @override
  ThemeExtension<BTThemeColor> copyWith({
    Color? primary,
    Color? primaryDarker,
    Color? primaryLighter,
    Color? primarySurface,
    Color? primaryBorder,
    Color? secondary,
    Color? secondarySurface,
    Color? secondaryBorder,
    Color? secondaryDarker,
    Color? neutral10,
    Color? neutral20,
    Color? neutral30,
    Color? neutral40,
    Color? neutral50,
    Color? neutral60,
    Color? neutral70,
    Color? neutral80,
    Color? neutral90,
    Color? neutral100,
    Color? success,
    Color? successDarker,
    Color? error,
    Color? errorDarker,
    Color? warning,
    Color? warningDarker,
    Color? badge,
    Color? textPrimary,
    Color? textPrimaryBlack,
    Color? textSecondary,
    Color? textOnBoardingCaption,
    Color? textInactive,
    Color? textPlaceholder,
    Color? textBody,
    Color? textMain,
    Color? textDarkBlue,
    Color? textPrice,
    Color? textWaitingState,
    Color? textError,
    Color? radioActive,
    Color? bgDefault,
    Color? bgSecondary,
    Color? bgMain,
    Color? bgError,
    Color? bgSuccess,
    Color? bgWarning,
    Color? bgInfoChip,
    Color? borderDefault,
    Color? borderInput,
    Color? borderSuccess,
    Color? borderError,
  }) {
    return BTThemeColor(
      primary: primary ?? this.primary,
      primaryDarker: primaryDarker ?? this.primaryDarker,
      primaryLighter: primaryLighter ?? this.primaryLighter,
      primarySurface: primarySurface ?? this.primarySurface,
      primaryBorder: primaryBorder ?? this.primaryBorder,
      secondary: secondary ?? this.secondary,
      secondarySurface: secondarySurface ?? this.secondarySurface,
      secondaryBorder: secondaryBorder ?? this.secondaryBorder,
      secondaryDarker: secondaryDarker ?? this.secondaryDarker,
      neutral10: neutral10 ?? this.neutral10,
      neutral20: neutral20 ?? this.neutral20,
      neutral30: neutral30 ?? this.neutral30,
      neutral40: neutral40 ?? this.neutral40,
      neutral50: neutral50 ?? this.neutral50,
      neutral60: neutral60 ?? this.neutral60,
      neutral70: neutral70 ?? this.neutral70,
      neutral80: neutral80 ?? this.neutral80,
      neutral90: neutral90 ?? this.neutral90,
      neutral100: neutral100 ?? this.neutral100,
      success: success ?? this.success,
      successDarker: successDarker ?? this.successDarker,
      error: error ?? this.error,
      errorDarker: errorDarker ?? this.errorDarker,
      warning: warning ?? this.warning,
      warningDarker: warningDarker ?? this.warningDarker,
      badge: badge ?? this.badge,
      textPrimary: textPrimary ?? this.textPrimary,
      textPrimaryBlack: textPrimaryBlack ?? this.textPrimaryBlack,
      textSecondary: textSecondary ?? this.textSecondary,
      textOnBoardingCaption:
          textOnBoardingCaption ?? this.textOnBoardingCaption,
      textInactive: textInactive ?? this.textInactive,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textBody: textBody ?? this.textBody,
      textMain: textMain ?? this.textMain,
      textDarkBlue: textDarkBlue ?? this.textDarkBlue,
      textPrice: textPrice ?? this.textPrice,
      textWaitingState: textWaitingState ?? this.textWaitingState,
      textError: textError ?? this.textError,
      radioActive: radioActive ?? this.radioActive,
      bgDefault: bgDefault ?? this.bgDefault,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      bgMain: bgMain ?? this.bgMain,
      bgError: bgError ?? this.bgError,
      bgSuccess: bgSuccess ?? this.bgSuccess,
      bgWarning: bgWarning ?? this.bgWarning,
      bgInfoChip: bgInfoChip ?? this.bgInfoChip,
      borderDefault: borderDefault ?? this.borderDefault,
      borderInput: borderInput ?? this.borderInput,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      borderError: borderError ?? this.borderError,
    );
  }

  @override
  ThemeExtension<BTThemeColor> lerp(
    covariant ThemeExtension<BTThemeColor>? other,
    double t,
  ) {
    if (other is! BTThemeColor) {
      return this;
    }

    return BTThemeColor(
      primary: Color.lerp(primary, other.primary, t),
      primaryDarker: Color.lerp(primaryDarker, other.primaryDarker, t),
      primaryLighter: Color.lerp(primaryLighter, other.primaryLighter, t),
      primarySurface: Color.lerp(primarySurface, other.primarySurface, t),
      primaryBorder: Color.lerp(primaryBorder, other.primaryBorder, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      secondarySurface: Color.lerp(secondarySurface, other.secondarySurface, t),
      secondaryBorder: Color.lerp(secondaryBorder, other.secondaryBorder, t),
      secondaryDarker: Color.lerp(secondaryDarker, other.secondaryDarker, t),
      neutral10: Color.lerp(neutral10, other.neutral10, t),
      neutral20: Color.lerp(neutral20, other.neutral20, t),
      neutral30: Color.lerp(neutral30, other.neutral30, t),
      neutral40: Color.lerp(neutral40, other.neutral40, t),
      neutral50: Color.lerp(neutral50, other.neutral50, t),
      neutral60: Color.lerp(neutral60, other.neutral60, t),
      neutral70: Color.lerp(neutral70, other.neutral70, t),
      neutral80: Color.lerp(neutral80, other.neutral80, t),
      neutral90: Color.lerp(neutral90, other.neutral90, t),
      neutral100: Color.lerp(neutral100, other.neutral100, t),
      success: Color.lerp(success, other.success, t),
      successDarker: Color.lerp(successDarker, other.successDarker, t),
      error: Color.lerp(error, other.error, t),
      errorDarker: Color.lerp(errorDarker, other.errorDarker, t),
      warning: Color.lerp(warning, other.warning, t),
      warningDarker: Color.lerp(warningDarker, other.warningDarker, t),
      badge: Color.lerp(badge, other.badge, t),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      textPrimaryBlack: Color.lerp(textPrimaryBlack, other.textPrimaryBlack, t),
      textOnBoardingCaption: Color.lerp(
        textOnBoardingCaption,
        other.textOnBoardingCaption,
        t,
      ),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textInactive: Color.lerp(textInactive, other.textInactive, t),
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t),
      textBody: Color.lerp(textBody, other.textBody, t),
      textMain: Color.lerp(textMain, other.textMain, t),
      textDarkBlue: Color.lerp(textDarkBlue, other.textDarkBlue, t),
      textPrice: Color.lerp(textPrice, other.textPrice, t),
      textWaitingState: Color.lerp(textWaitingState, other.textWaitingState, t),
      textError: Color.lerp(textError, other.textError, t),
      radioActive: Color.lerp(radioActive, other.radioActive, t),
      bgDefault: Color.lerp(bgDefault, other.bgDefault, t),
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t),
      bgMain: Color.lerp(bgMain, other.bgMain, t),
      bgError: Color.lerp(bgError, other.bgError, t),
      bgSuccess: Color.lerp(bgSuccess, other.bgSuccess, t),
      bgWarning: Color.lerp(bgWarning, other.bgWarning, t),
      bgInfoChip: Color.lerp(bgInfoChip, other.bgInfoChip, t),
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t),
      borderInput: Color.lerp(borderInput, other.borderInput, t),
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t),
      borderError: Color.lerp(borderError, other.borderError, t),
    );
  }

  static BTThemeColor light = const BTThemeColor(
    primary: BTColors.primary,
    primaryDarker: BTColors.primaryDarker,
    primaryLighter: BTColors.primaryLighter,
    primarySurface: BTColors.primarySurface,
    primaryBorder: BTColors.primaryBorder,
    secondary: BTColors.secondary,
    secondarySurface: BTColors.secondarySurface,
    secondaryBorder: BTColors.secondaryBorder,
    secondaryDarker: BTColors.secondaryDarker,
    neutral10: BTColors.neutral10,
    neutral20: BTColors.neutral20,
    neutral30: BTColors.neutral30,
    neutral40: BTColors.neutral40,
    neutral50: BTColors.neutral50,
    neutral60: BTColors.neutral60,
    neutral70: BTColors.neutral70,
    neutral80: BTColors.neutral80,
    neutral90: BTColors.neutral90,
    neutral100: BTColors.neutral100,
    success: BTColors.success,
    successDarker: BTColors.successDarker,
    error: BTColors.error,
    errorDarker: BTColors.errorDarker,
    warning: BTColors.warning,
    warningDarker: BTColors.warningDarker,
    badge: BTColors.badge,
    textPrimary: BTColors.textPrimary,
    textPrimaryBlack: BTColors.textPrimaryBlack,
    textSecondary: BTColors.textSecondary,
    textOnBoardingCaption: BTColors.textOnBoardingCaption,
    textInactive: BTColors.textInactive,
    textPlaceholder: BTColors.textPlaceholder,
    textBody: BTColors.textBody,
    textMain: BTColors.textMain,
    textDarkBlue: BTColors.textDarkBlue,
    textPrice: BTColors.textPrice,
    textWaitingState: BTColors.textWaitingState,
    textError: BTColors.textError,
    radioActive: BTColors.radioActive,
    bgDefault: BTColors.bgDefault,
    bgSecondary: BTColors.bgSecondary,
    bgMain: BTColors.bgMain,
    bgError: BTColors.bgError,
    bgSuccess: BTColors.bgSuccess,
    bgWarning: BTColors.bgWarning,
    bgInfoChip: BTColors.bgInfoChip,
    borderDefault: BTColors.borderDefault,
    borderInput: BTColors.borderInput,
    borderSuccess: BTColors.borderSuccess,
    borderError: BTColors.borderError,
  );

  static BTThemeColor dark = const BTThemeColor(
    primary: BTColors.primary,
    primaryDarker: BTColors.primaryDarker,
    primaryLighter: BTColors.primaryLighter,
    primarySurface: BTColors.primarySurface,
    primaryBorder: BTColors.primaryBorder,
    secondary: BTColors.secondary,
    secondarySurface: BTColors.secondarySurface,
    secondaryBorder: BTColors.secondaryBorder,
    secondaryDarker: BTColors.secondaryDarker,
    neutral10: BTColors.neutral10,
    neutral20: BTColors.neutral20,
    neutral30: BTColors.neutral30,
    neutral40: BTColors.neutral40,
    neutral50: BTColors.neutral50,
    neutral60: BTColors.neutral60,
    neutral70: BTColors.neutral70,
    neutral80: BTColors.neutral80,
    neutral90: BTColors.neutral90,
    neutral100: BTColors.neutral100,
    success: BTColors.success,
    successDarker: BTColors.successDarker,
    error: BTColors.error,
    errorDarker: BTColors.errorDarker,
    warning: BTColors.warning,
    warningDarker: BTColors.warningDarker,
    badge: BTColors.badge,
    textPrimary: BTColors.textPrimary,
    textPrimaryBlack: BTColors.textPrimaryBlack,
    textSecondary: BTColors.textSecondary,
    textOnBoardingCaption: BTColors.textOnBoardingCaption,
    textInactive: BTColors.textInactive,
    textPlaceholder: BTColors.textPlaceholder,
    textBody: BTColors.textBody,
    textMain: BTColors.textMain,
    textDarkBlue: BTColors.textDarkBlue,
    textPrice: BTColors.textPrice,
    textWaitingState: BTColors.textWaitingState,
    textError: BTColors.textError,
    radioActive: BTColors.radioActive,
    bgDefault: BTColors.bgDefault,
    bgSecondary: BTColors.bgSecondary,
    bgMain:  BTColors.bgMain,
    bgError: BTColors.bgError,
    bgSuccess: BTColors.bgSuccess,
    bgWarning: BTColors.bgWarning,
    bgInfoChip: BTColors.bgInfoChip,
    borderDefault: BTColors.borderDefault,
    borderInput: BTColors.borderInput,
    borderSuccess: BTColors.borderSuccess,
    borderError: BTColors.borderError,
  );

  @override
  String toString() {
    return 'BTThemeColor('
        'primary: $primary, '
        'primaryDarker: $primaryDarker, '
        'primaryLighter: $primaryLighter, '
        'primarySurface: $primarySurface, '
        'primaryBorder: $primaryBorder, '
        'secondary: $secondary, '
        'secondarySurface: $secondarySurface, '
        'secondaryBorder: $secondaryBorder, '
        'secondaryDarker: $secondaryDarker, '
        'neutral10: $neutral10, '
        'neutral20: $neutral20, '
        'neutral30: $neutral30, '
        'neutral40: $neutral40, '
        'neutral50: $neutral50, '
        'neutral60: $neutral60, '
        'neutral70: $neutral70, '
        'neutral80: $neutral80, '
        'neutral90: $neutral90, '
        'neutral100: $neutral100, '
        'success: $success, '
        'successDarker: $successDarker, '
        'error: $error, '
        'errorDarker: $errorDarker, '
        'warning: $warning, '
        'warningDarker: $warningDarker, '
        'badge: $badge, '
        'textPrimary: $textPrimary, '
        'textPrimaryBlack: $textPrimaryBlack, '
        'textSecondary: $textSecondary, '
        'textOnBoardingCaption: $textOnBoardingCaption, '
        'textInactive: $textInactive, '
        'textPlaceholder: $textPlaceholder, '
        'textBody: $textBody, '
        'textMain: $textMain, '
        'textDarkBlue: $textDarkBlue, '
        'textPrice: $textPrice, '
        'textWaitingState: $textWaitingState, '
        'textError: $textError, '
        'radioActive: $radioActive, '
        'bgDefault: $bgDefault, '
        'bgSecondary: $bgSecondary, '
        'bgMain: $bgMain, '
        'bgError: $bgError, '
        'bgSuccess: $bgSuccess, '
        'bgWarning: $bgWarning, '
        'bgInfoChip: $bgInfoChip, '
        'borderDefault: $borderDefault, '
        'borderInput: $borderInput, '
        'borderSuccess: $borderSuccess, '
        'borderError: $borderError, '
        ')';
  }
}
