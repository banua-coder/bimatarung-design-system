import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTSnackbar extends StatelessWidget {
  BTSnackbar({
    super.key,
    this.state = BTSnackbarState.normal,
    required this.message,
    this.bottomPadding,
    this.leading,
    this.actionCallback,
    this.actionText,
  });

  final BTSnackbarState state;

  final String message;
  final double? bottomPadding;
  final Widget? leading;

  final String? actionText;
  final void Function()? actionCallback;

  final ValueNotifier<bool> _isClicked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => Container(
        width: 1.sw,
        padding: EdgeInsets.all(12.r),
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: bottomPadding ?? 20.h,
        ),
        decoration: BoxDecoration(
          color: state.style.bgColor,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            color: state.style.borderColor,
          ),
        ),
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: leading,
              ),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: BTTextStyle.bodySmall(
                  fontWeight: FontWeight.w600,
                  color: state.style.textColor,
                ),
              ),
            ),
            if (actionCallback != null && actionText != null)
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: InkWell(
                  onTap: () {
                    if (!_isClicked.value) {
                      _isClicked.value = true;
                      actionCallback?.call();
                    } else {
                      log('Snackbar has been clicked!');
                    }
                  },
                  child: Text(
                    actionText!,
                    style: BTTextStyle.bodySmall(
                      fontWeight: FontWeight.w600,
                      color: state.style.actionColor,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}
