import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTButtonStyle {
  static ButtonThemeData main() => ButtonThemeData(
        height: 48.h,
        buttonColor: Colors.transparent,
        disabledColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      );

  static ButtonStyle disableButtonPrimary() => FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        disabledBackgroundColor: BTColors.neutral40,
        backgroundColor: BTColors.neutral40,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      );

  static ButtonStyle primary({
    Color? textColor = BTColors.textPrimary,
    Color? bgColor = BTColors.primary,
    Color? overlayColor = BTColors.primaryDarker,
  }) =>
      ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: MaterialStatePropertyAll(bgColor),
        overlayColor: MaterialStatePropertyAll(
          overlayColor ?? bgColor?.withOpacity(0.05),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        foregroundColor: MaterialStatePropertyAll(
          textColor,
        ),
      );

  static ButtonStyle social() => ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(BTColors.neutral20),
        overlayColor: const MaterialStatePropertyAll(
          BTColors.neutral40,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          BTColors.textPrimaryBlack,
        ),
      );

  static ButtonStyle cta() => ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(BTColors.bgDefault),
        overlayColor: const MaterialStatePropertyAll(
          BTColors.neutral20,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          BTColors.textMain,
        ),
      );

  static ButtonStyle outline({
    Color? borderColor = BTColors.primary,
  }) =>
      ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: MaterialStatePropertyAll(
          borderColor?.withOpacity(0.05),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(
              color: borderColor ?? BTColors.primary,
            ),
          ),
        ),
        foregroundColor: MaterialStatePropertyAll(
          borderColor,
        ),
      );

  static ButtonStyle outlineDisabled() => ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(
          BTColors.primarySurface,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: const BorderSide(
              color: BTColors.neutral50,
            ),
          ),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          BTColors.neutral40,
        ),
      );

  static ButtonStyle text({
    Color? textColor = BTColors.primary,
  }) =>
      ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: MaterialStatePropertyAll(
          textColor?.withOpacity(0.05),
        ),
        foregroundColor: MaterialStatePropertyAll(
          textColor,
        ),
      );

  static ButtonStyle textDisabled() => ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        splashFactory: InkSplash.splashFactory,
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48.h)),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(
          BTColors.primarySurface,
        ),
        foregroundColor: const MaterialStatePropertyAll(
          BTColors.textInactive,
        ),
      );
}
