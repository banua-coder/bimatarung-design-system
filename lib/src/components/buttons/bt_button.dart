import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../../bimatarung_design_system.dart';
import '../../core/util/typedef.dart';

class BTButton extends StatelessWidget {
  const BTButton({
    super.key,
    this.debounce = true,
    this.size = BTButtonSize.normal,
    this.type = BTButtonType.primary,
    this.width,
    this.child,
    this.label,
    this.labelColor,
    this.bgColor,
    this.onPressed,
    this.onPressCooldown,
    this.socialIcon,
    this.disabled = false,
    this.forDialog = false,
  }) : assert(
          child != null || label != null,
          'You must provide one of child or label',
        );

  /// set 'false' if you can use button without debouncer.
  /// by default this value is 'true', the button using debouncer for
  /// backpresure anticipation from user
  final bool debounce;

  /// height of button
  final BTButtonSize size;

  /// type of button
  final BTButtonType type;

  /// width of button
  final double? width;

  /// child of button
  final Widget? child;

  /// label/text for button text
  final String? label;

  final Color? labelColor;

  final Color? bgColor;

  /// onPressed of button
  final BTButtonCallback onPressed;

  /// cooldown duration before user can click again
  final Duration? onPressCooldown;

  /// social icon for social button
  final Widget? socialIcon;

  /// flag disable button
  /// default to 'false'
  final bool disabled;

  /// flag check if button is for dialog.
  /// default to 'false'
  final bool forDialog;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: size.height,
        width: width ?? ScreenUtil().screenWidth,
        child: TapDebouncer(
          key: key,
          onTap: onPressed,
          cooldown: onPressCooldown,
          waitBuilder: (context, child) => _getWaitBuilder(type),
          builder: (context, onTap) => _getChildBuilder(type, onTap),
        ),
      );

  Widget _getWaitBuilder(BTButtonType type) {
    switch (type) {
      case BTButtonType.primary:
        return ElevatedButton(
          onPressed: () {
            return;
          },
          style: BTButtonStyle.primary(
            bgColor: bgColor,
            textColor: labelColor,
            forDialog: forDialog,
          ),
          child: SpinKitFadingCircle(
            size: size.height - 20.h * 1.r,
            color: labelColor ?? _checkColorStyle(type, disabled),
          ),
        );

      case BTButtonType.ghost:
        return TextButton(
          onPressed: () {
            return;
          },
          style: BTButtonStyle.text(
            forDialog: forDialog,
            textColor: labelColor,
          ),
          child: SpinKitFadingCircle(
            size: size.height - 20.h * 1.r,
            color: labelColor ?? _checkColorStyle(type, disabled),
          ),
        );
      case BTButtonType.secondary:
        return OutlinedButton(
          onPressed: () {
            return;
          },
          style: BTButtonStyle.outline(
            borderColor: labelColor ?? _checkColorStyle(type, disabled),
            disabled: disabled,
            forDialog: forDialog,
          ),
          child: SpinKitFadingCircle(
            size: size.height - 20.h * 1.r,
            color: labelColor ?? _checkColorStyle(type, disabled),
          ),
        );
    }
  }

  Widget _getChildBuilder(BTButtonType type, BTButtonCallback onTap) {
    switch (type) {
      case BTButtonType.primary:
        return ElevatedButton(
          onPressed: disabled ? null : onTap,
          style: BTButtonStyle.primary(
            textColor: labelColor,
            bgColor: bgColor,
            forDialog: forDialog,
          ),
          child: child ??
              ((socialIcon == null)
                  ? Text(
                      label ?? '',
                      style: size == BTButtonSize.big
                          ? BTTextStyle.subHeading(
                              fontWeight: FontWeight.w500,
                            )
                          : BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                            ),
                    )
                  : Row(
                      children: [
                        Opacity(
                          opacity: disabled ? 0.2 : 1,
                          child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: socialIcon!,
                          ),
                        ),
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.bodySmall(),
                          ),
                        ),
                      ],
                    )),
        );

      case BTButtonType.secondary:
        return OutlinedButton(
          onPressed: disabled ? null : onTap,
          style: BTButtonStyle.outline(
            borderColor: labelColor,
            disabled: disabled,
            forDialog: forDialog,
          ),
          child: child ??
              ((socialIcon == null)
                  ? Text(
                      label ?? '',
                      style: size == BTButtonSize.big
                          ? BTTextStyle.subHeading(
                              fontWeight: FontWeight.w500,
                            )
                          : BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                            ),
                    )
                  : Row(
                      children: [
                        Opacity(
                          opacity: disabled ? 0.2 : 1,
                          child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: socialIcon!,
                          ),
                        ),
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.bodySmall(),
                          ),
                        ),
                      ],
                    )),
        );
      case BTButtonType.ghost:
        return TextButton(
          onPressed: disabled ? null : onTap,
          style: BTButtonStyle.text(
            textColor: labelColor,
            forDialog: forDialog,
          ),
          child: child ??
              ((socialIcon == null)
                  ? Text(
                      label ?? '',
                      style: size == BTButtonSize.big
                          ? BTTextStyle.subHeading(
                              fontWeight: FontWeight.w500,
                              color: labelColor ?? bgColor,
                            )
                          : BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                              color: labelColor ?? bgColor,
                            ),
                    )
                  : Row(
                      children: [
                        Opacity(
                          opacity: disabled ? 0.2 : 1,
                          child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: socialIcon!,
                          ),
                        ),
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.bodySmall(),
                          ),
                        ),
                      ],
                    )),
        );
    }
  }

  Color _checkColorStyle(BTButtonType type, bool disabled) {
    switch (type) {
      case BTButtonType.primary:
        return disabled ? BTColors.textInactive : BTColors.textPrimary;
      case BTButtonType.secondary:
      case BTButtonType.ghost:
        return disabled ? BTColors.textInactive : BTColors.primary;
    }
  }
}
