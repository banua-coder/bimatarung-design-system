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
          borderRadius: BorderRadius.circular(8.r),
        ),
      );

  static ButtonStyle primary({
    Color? textColor = BTColors.textPrimary,
    Color? bgColor = BTColors.primary,
    Color? overlayColor = BTColors.primaryDarker,
    bool forDialog = false,
  }) =>
      FilledButton.styleFrom(
        elevation: 0,
        splashFactory: InkSplash.splashFactory,
        minimumSize: Size(ScreenUtil().screenWidth, 48.h),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(forDialog ? 100.r : 8.r),
        ),
        foregroundColor: textColor,
        disabledBackgroundColor: BTColors.neutral30,
        disabledForegroundColor: BTColors.textInactive,
      );

  static ButtonStyle outline({
    Color? borderColor = BTColors.primary,
    bool disabled = true,
    bool forDialog = false,
  }) =>
      OutlinedButton.styleFrom(
        elevation: 0,
        splashFactory: InkSplash.splashFactory,
        minimumSize: Size(ScreenUtil().screenWidth, 48.h),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(forDialog ? 100.r : 8.r),
        ),
        side: BorderSide(
          color:
              disabled ? BTColors.neutral40 : borderColor ?? BTColors.primary,
          width: 1.sp,
        ),
        foregroundColor: borderColor,
        disabledBackgroundColor: BTColors.neutral20,
        disabledForegroundColor: BTColors.textInactive,
      );

  static ButtonStyle text({
    Color? textColor = BTColors.primary,
    bool forDialog = false,
  }) =>
      TextButton.styleFrom(
        elevation: 0,
        splashFactory: InkSplash.splashFactory,
        minimumSize: Size(ScreenUtil().screenWidth, 48.h),
        backgroundColor: Colors.transparent,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(forDialog ? 100.r : 8.r),
        ),
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: BTColors.textInactive,
      );
}
