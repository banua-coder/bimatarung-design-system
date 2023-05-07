import '../../../../bimatarung_design_system.dart';

enum BTSnackbarState {
  failed,
  normal,
  warning,
  success;

  BTSnackbarStyle get style {
    switch (this) {
      case BTSnackbarState.success:
        return const BTSnackbarStyle(
          bgColor: BTColors.bgSuccess,
          textColor: BTColors.successDarker,
          actionColor: BTColors.successDarker,
          borderColor: BTColors.success,
        );
      case BTSnackbarState.normal:
        return const BTSnackbarStyle(
          bgColor: BTColors.primary,
          textColor: BTColors.textPrimary,
          actionColor: BTColors.textPrimary,
          borderColor: BTColors.primary,
        );
      case BTSnackbarState.warning:
        return const BTSnackbarStyle(
          bgColor: BTColors.bgWarning,
          textColor: BTColors.warningDarker,
          actionColor: BTColors.warningDarker,
          borderColor: BTColors.warning,
        );
      case BTSnackbarState.failed:
        return const BTSnackbarStyle(
          bgColor: BTColors.bgError,
          textColor: BTColors.errorDarker,
          actionColor: BTColors.errorDarker,
          borderColor: BTColors.error,
        );
    }
  }
}
