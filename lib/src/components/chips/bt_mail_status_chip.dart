/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-05-08 22:36:25
/// @modify date 2023-05-08 22:36:25
/// @desc
import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTMailStatusChip extends StatelessWidget {
  const BTMailStatusChip({super.key, required this.state, this.label});

  final String? label;
  final BTMailCardState state;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: state.bgColor,
          border: Border.all(
            color: state.borderColor,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        child: Text(
          label ?? state.name,
          style: BTTextStyle.note(
            color: state.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
