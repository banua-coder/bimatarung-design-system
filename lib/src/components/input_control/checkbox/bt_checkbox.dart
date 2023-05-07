/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 00:12:14
/// @modify date 2023-04-16 00:12:14
/// @desc

import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

class BTCheckbox extends StatelessWidget {
  const BTCheckbox({
    super.key,
    required this.label,
    required this.formControl,
    this.onTap,
    required this.onChange,
  });

  final String label;
  final AbstractControl<dynamic> formControl;
  final GestureTapCallback? onTap;
  final Function(FormControl<bool>) onChange;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          ReactiveCheckbox(
            formControl: formControl as FormControl<bool>,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            activeColor: BTColors.primary,
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return BTColors.primary;
                }
                return BTColors.neutral40;
              },
            ),
            onChanged: onChange,
          ),
          InkWell(
            onTap: onTap ?? () => formControl.value = !formControl.value,
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
