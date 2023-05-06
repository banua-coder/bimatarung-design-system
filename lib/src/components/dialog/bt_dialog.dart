import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTDialog extends StatelessWidget {
  const BTDialog({
    super.key,
    required this.title,
    this.content,
    this.textContent,
    this.contentTextStyle,
    this.icon,
    this.iconColor,
    this.iconBgColor = BTColors.primary,
    this.buttonLeft,
    this.buttonRight,
    this.padding,
    this.showCloseButton = true,
    this.iconSize = 36,
    this.buttonClose,
  });

  final String title;

  final Widget? content;

  final String? textContent;

  final TextStyle? contentTextStyle;

  final Widget? icon;

  final Color? iconColor;

  final Color iconBgColor;

  final Widget? buttonLeft;

  final Widget? buttonRight;

  final EdgeInsetsGeometry? padding;

  final bool showCloseButton;

  final double iconSize;

  final Function()? buttonClose;

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Dialog(
          elevation: 20,
          backgroundColor: BTColors.bgDefault,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 20.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (icon != null) ...[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: iconBgColor,
                              ),
                              width: iconSize * 1.w,
                              height: iconSize * 1.w,
                              child: Center(child: icon),
                            ),
                            8.verticalSpace,
                          ],
                          Text(
                            title,
                            style: BTTextStyle.subHeading(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (showCloseButton)
                      InkWell(
                        onTap: buttonClose ?? () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(100.r),
                        child: Padding(
                          padding: EdgeInsets.all(2.r),
                          child: const Icon(
                            Icons.close_rounded,
                            color: BTColors.textPrimaryBlack,
                          ),
                        ),
                      ),
                  ],
                ),
                16.verticalSpace,
                if (content == null)
                  Text(
                    textContent ?? '',
                    style: contentTextStyle ??
                        BTTextStyle.bodySmall(
                          color: BTColors.textSecondary,
                        ),
                  )
                else
                  content ?? const SizedBox.shrink(),
                if (buttonLeft == null && buttonRight == null)
                  const SizedBox.shrink()
                else
                  26.verticalSpace,
                Row(
                  children: [
                    if (buttonLeft == null)
                      const SizedBox.shrink()
                    else
                      Expanded(child: buttonLeft ?? nil),
                    if (buttonLeft != null && buttonRight != null)
                      10.horizontalSpace
                    else
                      const SizedBox.shrink(),
                    if (buttonRight == null)
                      const SizedBox.shrink()
                    else
                      Expanded(child: buttonRight ?? nil),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
