import '../../../../bimatarung_design_system.dart';

enum BTFilePickerState {
  idle,
  valid,
  invalid;

  BTFilePickerStyle get style {
    switch (this) {
      case BTFilePickerState.idle:
      case BTFilePickerState.valid:
        return BTFilePickerStyle(
          bgColor: BTColors.primaryLighter,
          foregroundColor: BTColors.primaryDarker,
          borderColor: BTColors.primary,
          splashColor: BTColors.primaryDarker.withOpacity(0.3),
        );

      case BTFilePickerState.invalid:
        return BTFilePickerStyle(
          bgColor: BTColors.bgError,
          foregroundColor: BTColors.errorDarker,
          borderColor: BTColors.error,
          splashColor: BTColors.errorDarker.withOpacity(0.3),
        );
    }
  }
}
