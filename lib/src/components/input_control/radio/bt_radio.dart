/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 03:11:25
/// @modify date 2023-04-16 03:11:25
/// @desc

import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

class BTRadio<T> extends StatelessWidget {
  const BTRadio({
    super.key,
    required this.label,
    this.value,
    required this.formControl,
    this.onTap,
    this.onChanged,
  });

  final String label;
  final T? value;
  final AbstractControl<dynamic> formControl;

  final Function(FormControl<T?>)? onChanged;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          ReactiveRadio<T?>(
            value: value,
            formControl: formControl as FormControl<T>,
            activeColor: BTColors.primary,
            onChanged: onChanged,
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return BTColors.primary;
                }
                return BTColors.neutral40;
              },
            ),
          ),
          InkWell(
            onTap: onTap ?? () => formControl.value = value,
            child: Text(
              label,
              style: BTTextStyle.body(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
}
