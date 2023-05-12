/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 00:28:58
/// @modify date 2023-04-16 00:28:58
/// @desc
import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

class BTCheckboxListTile extends StatelessWidget {
  const BTCheckboxListTile({
    super.key,
    required this.title,
    this.value,
    this.secondary,
    required this.onChange,
    this.subtitle,
    this.padding,
    this.controlAffinity = ListTileControlAffinity.leading,
  });
  final Widget title;
  final bool? value;
  final Widget? secondary;
  final Widget? subtitle;
  final EdgeInsets? padding;
  final ListTileControlAffinity controlAffinity;
  final void Function(bool?) onChange;

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        value: value,
        onChanged: onChange,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        controlAffinity: controlAffinity,
        title: title,
        contentPadding: padding,
        activeColor: BTColors.primary,
        dense: true,
        subtitle: subtitle,
      );
}
