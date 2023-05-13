/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-05-14 05:01:15
/// @modify date 2023-05-14 05:01:15
/// @desc

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../bimatarung_design_system.dart';

class BTPinput extends StatelessWidget {
  const BTPinput({
    super.key,
    required this.controller,
    this.length = 6,
    this.keyvoardType = TextInputType.text,
    this.isError = false,
    this.errorText,
  });

  /// length of pin
  /// Default to 6.
  final int length;

  /// [TextEditingController] for this pinput
  final TextEditingController controller;

  /// Desired input type.
  /// Default to [TextInputType.text]
  final TextInputType keyvoardType;

  /// Flag to set error to pinput
  /// Default to false.
  final bool isError;

  /// Error text to displayed.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: length,
      textInputAction: TextInputAction.done,
      keyboardType: keyvoardType,
      defaultPinTheme: PinTheme(
        textStyle: BTTextStyle.subHeading(
          fontWeight: FontWeight.w600,
        ),
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: BTColors.primarySurface.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      errorPinTheme: PinTheme(
        textStyle: BTTextStyle.subHeading(
          fontWeight: FontWeight.w600,
        ),
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: BTColors.primaryLighter.withOpacity(0.4),
          border: Border.all(
            color: BTColors.error.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      focusedPinTheme: PinTheme(
        textStyle: BTTextStyle.subHeading(
          fontWeight: FontWeight.w600,
        ),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: BTColors.primaryLighter.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: BTColors.primaryLighter.withOpacity(0.9),
              blurRadius: 4,
              spreadRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: BTColors.primary.withOpacity(0.2),
          ),
        ),
      ),
      submittedPinTheme: PinTheme(
        textStyle: BTTextStyle.subHeading(
          fontWeight: FontWeight.w600,
        ),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: BTColors.primaryLighter.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: BTColors.primaryLighter.withOpacity(0.9),
              blurRadius: 4,
              spreadRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: BTColors.primary.withOpacity(0.2),
          ),
        ),
      ),
      followingPinTheme: PinTheme(
        textStyle: BTTextStyle.subHeading(
          fontWeight: FontWeight.w600,
        ),
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: BTColors.primaryLighter.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      errorTextStyle: BTTextStyle.bodySmall(
        color: BTColors.error,
      ),
      textCapitalization: TextCapitalization.characters,
      autofocus: true,
      forceErrorState: isError,
      errorText: errorText,
    );
  }
}
