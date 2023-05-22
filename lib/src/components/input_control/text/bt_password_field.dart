/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-21 12:53:13
/// @modify date 2023-04-21 12:53:13
/// @desc

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../bimatarung_design_system.dart';
import '../bt_form_mixin.dart';

class BTPasswordField extends StatelessWidget with BTFormMixin {
  const BTPasswordField({
    super.key,
    this.label,
    this.controller,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.onChange,
    this.onSubmitted,
    this.prefixIcon,
    this.helperText,
    this.hintText,
    this.initialValue,
    this.focusNode,
    this.obscuringCharacter = '*',
    this.onEditingComplete,
    this.textInputAction,
    required this.formControl,
    this.validationMessages,
    this.isLabelOutside = true,
  });

  final String? label;
  final TextEditingController? controller;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final Function(FormControl<Object?>)? onChange;
  final Function(FormControl<dynamic>)? onSubmitted;

  final Widget? prefixIcon;
  final String? helperText;
  final String? hintText;
  final String? initialValue;

  final FocusNode? focusNode;
  final String obscuringCharacter;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final AbstractControl<dynamic> formControl;
  final Map<String, String Function(Object)>? validationMessages;
  final bool isLabelOutside;

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool?>(
      builder: (isFocus, onFocusChange) => Focus(
        onFocusChange: onFocusChange,
        child: ValueBuilder<bool?>(
          builder: (isShowingPassword, onTogglePassword) => StreamBuilder(
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

              var form = ReactiveTextField(
                focusNode: focusNode,
                obscureText: !isShowingPassword!,
                onChanged: (value) {
                  if (onChange != null) {
                    onChange?.call(value);
                  }
                },
                onSubmitted: onSubmitted,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: textInputAction,
                readOnly: readOnly,
                formControl: formControl as FormControl,
                maxLength: maxLength,
                style: BTTextStyle.body(
                  fontWeight: FontWeight.w600,
                ),
                validationMessages: validationMessages,
                decoration: InputDecoration(
                  enabled: enabled,
                  iconColor: determineFloatingLabelColor(
                    isFocus!,
                    isValid,
                    formControl,
                  ),
                  prefixIcon: prefixIcon,
                  suffixIcon: IconButton(
                    onPressed: () async => onTogglePassword(!isShowingPassword),
                    icon: Icon(
                      isShowingPassword
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_solid,
                    ),
                  ),
                  helperText: helperText,
                  helperStyle: BTTextStyle.caption(
                    color: BTColors.neutral60,
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
                  labelStyle: BTTextStyle.body(),
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
                        form,
                      ],
                    )
                  : form;
            },
            initialData: ControlStatus.pending,
            stream: formControl.statusChanged,
          ),
          initialValue: false,
        ),
      ),
      initialValue: false,
    );
  }
}
