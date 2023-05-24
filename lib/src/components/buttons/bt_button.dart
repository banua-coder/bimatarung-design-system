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
    this.icon,
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

  /// icon to show next to label
  final Widget? icon;

  /// flag disable button
  /// default to 'false'
  final bool disabled;

  /// flag check if button is for dialog.
  /// default to 'false'
  final bool forDialog;

  factory BTButton.secondary({
    bool debounce = true,
    BTButtonSize size = BTButtonSize.normal,
    double? width,
    Widget? child,
    String? label,
    Color? labelColor,
    Color? bgColor,
    BTButtonCallback onPressed,
    Duration? onPressCooldown,
    Widget? icon,
    bool disabled = false,
    bool forDialog = false,
  }) =>
      BTButton(
        debounce: debounce,
        size: size,
        width: width,
        label: label,
        labelColor: labelColor,
        bgColor: bgColor,
        onPressed: onPressed,
        onPressCooldown: onPressCooldown,
        type: BTButtonType.secondary,
        icon: icon,
        disabled: disabled,
        forDialog: forDialog,
        child: child,
      );

  factory BTButton.primary({
    bool debounce = true,
    BTButtonSize size = BTButtonSize.normal,
    double? width,
    Widget? child,
    String? label,
    Color? labelColor,
    Color? bgColor,
    BTButtonCallback onPressed,
    Duration? onPressCooldown,
    Widget? icon,
    bool disabled = false,
    bool forDialog = false,
  }) =>
      BTButton(
        debounce: debounce,
        size: size,
        width: width,
        label: label,
        labelColor: labelColor,
        bgColor: bgColor,
        onPressed: onPressed,
        onPressCooldown: onPressCooldown,
        icon: icon,
        disabled: disabled,
        forDialog: forDialog,
        child: child,
      );

  factory BTButton.ghost({
    bool debounce = true,
    BTButtonSize size = BTButtonSize.normal,
    double? width,
    Widget? child,
    String? label,
    Color? labelColor,
    Color? bgColor,
    BTButtonCallback onPressed,
    Duration? onPressCooldown,
    Widget? icon,
    bool disabled = false,
    bool forDialog = false,
  }) =>
      BTButton(
        debounce: debounce,
        size: size,
        width: width,
        label: label,
        labelColor: labelColor,
        bgColor: bgColor,
        onPressed: onPressed,
        onPressCooldown: onPressCooldown,
        type: BTButtonType.ghost,
        icon: icon,
        disabled: disabled,
        forDialog: forDialog,
        child: child,
      );

  factory BTButton.icon({
    bool debounce = true,
    BTButtonSize size = BTButtonSize.normal,
    BTButtonType type = BTButtonType.primary,
    double? width,
    Widget? child,
    String? label,
    Color? labelColor,
    Color? bgColor,
    BTButtonCallback onPressed,
    Duration? onPressCooldown,
    required Widget icon,
    bool disabled = false,
    bool forDialog = false,
  }) =>
      BTButton(
        debounce: debounce,
        size: size,
        width: width,
        label: label,
        labelColor: labelColor,
        bgColor: bgColor,
        onPressed: onPressed,
        onPressCooldown: onPressCooldown,
        type: type,
        icon: icon,
        disabled: disabled,
        forDialog: forDialog,
        child: child,
      );

  @override
  Widget build(BuildContext context) => SizedBox(
        height: size.height,
        width: width ?? ScreenUtil().screenWidth,
        child: debounce
            ? TapDebouncer(
                key: key,
                onTap: onPressed,
                cooldown: onPressCooldown,
                waitBuilder: (context, child) => _getWaitBuilder(type),
                builder: (context, onTap) => _getChildBuilder(type, onTap),
              )
            : Builder(
                builder: (_) => _getChildBuilder(
                  type,
                  onPressed,
                ),
              ),
      );

  Widget _getWaitBuilder(BTButtonType type) {
    switch (type) {
      case BTButtonType.primary:
        return FilledButton(
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
        return FilledButton(
          onPressed: disabled ? null : onTap,
          style: BTButtonStyle.primary(
            textColor: labelColor,
            bgColor: bgColor,
            forDialog: forDialog,
          ),
          child: child ??
              ((icon == null)
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                              color: labelColor ?? bgColor,
                            ),
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
              ((icon == null)
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                              color: labelColor ?? bgColor,
                            ),
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
              ((icon == null)
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        8.horizontalSpace,
                        Flexible(
                          child: Text(
                            label ?? '',
                            style: BTTextStyle.body(
                              fontWeight: FontWeight.w500,
                              color: labelColor ?? bgColor,
                            ),
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
