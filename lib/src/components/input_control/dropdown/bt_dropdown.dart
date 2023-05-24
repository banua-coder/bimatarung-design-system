/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-21 21:56:31
/// @modify date 2023-04-21 21:56:31
/// @desc

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../bimatarung_design_system.dart';
import '../bt_form_mixin.dart';

class BTDropdown<T> extends StatelessWidget with BTFormMixin {
  const BTDropdown({
    super.key,
    this.label,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.hintText,
    this.initialValue,
    required this.items,
    this.focusNode,
    this.validationMessages,
    required this.formControl,
    this.isLabelOutside = true,
    this.isRequired = false,
    this.onTap,
  });

  final String? label;

  final bool readOnly;
  final bool enabled;
  final bool isRequired;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? helperText;
  final String? hintText;

  final String? initialValue;

  final List<DropdownMenuItem<T?>> items;
  final bool isLabelOutside;
  final FocusNode? focusNode;

  final AbstractControl<dynamic> formControl;
  final Map<String, String Function(Object)>? validationMessages;

  final void Function(FormControl<T?>)? onTap;

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool?>(
      builder: (isFocus, onFocusChange) => Focus(
        onFocusChange: onFocusChange,
        child: StreamBuilder(
          builder: (_, snapshot) {
            var isValid = false;

            if (snapshot.hasData) {
              isValid = snapshot.data == ControlStatus.valid;
            }

            var floatingLabelStyle = isLabelOutside
                ? null
                : BTTextStyle.bodySmall(
                    color: determineFloatingLabelColor(
                      isFocus!,
                      isValid,
                      formControl,
                    ),
                  );

            var labelStyle = isLabelOutside ? BTTextStyle.body() : null;

            var formWidget = ReactiveDropdownField<T?>(
              focusNode: focusNode,
              items: items,
              validationMessages: validationMessages,
              readOnly: readOnly,
              onTap: onTap,
              iconSize: 16.sp,
              formControl: formControl as FormControl<T?>,
              style: BTTextStyle.body(
                color: BTColors.textPrimaryBlack,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: BorderRadius.circular(10.r),
              icon: const Icon(CupertinoIcons.chevron_down),
              decoration: InputDecoration(
                enabled: enabled,
                iconColor: determineFloatingLabelColor(
                  isFocus!,
                  isValid,
                  formControl,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                helperText: helperText,
                helperStyle: BTTextStyle.bodySmall(
                  color: BTColors.neutral60,
                ),
                hintText: hintText,
                hintStyle: BTTextStyle.body(
                  color: BTColors.neutral60,
                ),
                isDense: true,
                labelText: isLabelOutside ? null : label,
                floatingLabelStyle: floatingLabelStyle,
                errorStyle: BTTextStyle.bodySmall(
                  color: BTColors.error,
                ),
                labelStyle: labelStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BTColors.neutral40,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BTColors.primary,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BTColors.neutral40,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BTColors.error,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: BTColors.error,
                  ),
                ),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(12.r),
              ),
            );

            return isLabelOutside
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            label ?? '',
                            style: labelStyle,
                          ),
                          if (isRequired)
                            Text(
                              '*',
                              style: labelStyle?.copyWith(
                                color: BTColors.error,
                              ),
                            ),
                        ],
                      ),
                      8.verticalSpace,
                      formWidget,
                    ],
                  )
                : formWidget;
          },
          initialData: ControlStatus.pending,
          stream: formControl.statusChanged,
        ),
      ),
      initialValue: false,
    );
  }
}
