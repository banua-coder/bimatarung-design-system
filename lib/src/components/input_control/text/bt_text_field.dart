/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-21 13:53:12
/// @modify date 2023-04-21 13:53:12
/// @desc

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../bimatarung_design_system.dart';
import '../bt_form_mixin.dart';

class BTTextField extends StatelessWidget with BTFormMixin {
  const BTTextField({
    super.key,
    this.label,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.hintText,
    this.maxLines,
    this.initialValue,
    this.obscureText = false,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
    this.validationMessages,
    required this.formControl,
    this.obscuringCharacter = '*',
    this.isLabelOutside = true,
    this.onTap,
  });

  final String? label;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  final bool readOnly;
  final bool enabled;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? helperText;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;

  final bool obscureText;
  final bool isLabelOutside;
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final Function(FormControl<dynamic>)? onSubmitted;
  final TextInputAction? textInputAction;
  final AbstractControl<dynamic> formControl;
  final Map<String, String Function(Object)>? validationMessages;
  final Function(FormControl<dynamic>)? onTap;

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
                    fontWeight: FontWeight.w600,
                    color: determineFloatingLabelColor(
                      isFocus!,
                      isValid,
                      formControl,
                    ),
                  );

            var labelStyle = isLabelOutside ? BTTextStyle.body() : null;

            var formWidget = ReactiveTextField(
              focusNode: focusNode,
              obscureText: obscureText,
              validationMessages: validationMessages,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              readOnly: readOnly,
              inputFormatters: inputFormatters,
              formControl: formControl as FormControl,
              maxLines: maxLines,
              maxLength: maxLength,
              style: BTTextStyle.body(
                fontWeight: FontWeight.w600,
              ),
              onTap: onTap,
              decoration: InputDecoration(
                iconColor: determineFloatingLabelColor(
                  isFocus!,
                  isValid,
                  formControl,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                helperText: helperText,
                helperStyle: BTTextStyle.caption(
                  color: BTColors.neutral40,
                ),
                hintText: hintText,
                hintStyle: BTTextStyle.body(
                  color: BTColors.neutral60,
                ),
                isDense: true,
                labelText: isLabelOutside ? null : label,
                floatingLabelStyle: floatingLabelStyle,
                errorStyle: BTTextStyle.caption(
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
              ),
              cursorColor: determineFloatingLabelColor(
                isFocus,
                isValid,
                formControl,
              ),
            );

            return isLabelOutside
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label ?? '',
                        style: labelStyle,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
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
