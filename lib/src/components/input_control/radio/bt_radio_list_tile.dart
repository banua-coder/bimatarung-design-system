/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 03:22:36
/// @modify date 2023-04-16 03:22:36
/// @desc
import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

class BTRadioListTile<T> extends StatelessWidget {
  const BTRadioListTile({
    super.key,
    this.value,
    this.groupValue,
    required this.onChanged,
    this.title,
    this.secondary,
    this.subtitle,
  });

  final T? value;
  final T? groupValue;
  final Function(T?) onChanged;
  final Widget? title;
  final Widget? secondary;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) => RadioListTile<T?>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: title,
        activeColor: BTColors.primary,
        controlAffinity: ListTileControlAffinity.trailing,
        dense: true,
        secondary: secondary,
        subtitle: subtitle,
      );
}
