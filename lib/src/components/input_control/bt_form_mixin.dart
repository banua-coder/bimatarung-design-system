import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

mixin BTFormMixin {
  Color determineFloatingLabelColor(
    bool isFocus,
    bool isValid,
    AbstractControl formControl,
  ) {
    if (formControl.pristine && !formControl.touched) {
      return isFocus ? BTColors.primary : BTColors.neutral40;
    }

    if (!isValid && formControl.touched) {
      return BTColors.error;
    }

    return isFocus ? BTColors.primary : BTColors.neutral40;
  }
}
