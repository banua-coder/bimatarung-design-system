import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

enum BTMailCardState {
  draft,
  pending,
  sent,
  failed;

  Color get bgColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.bgDefault;
      case BTMailCardState.pending:
        return BTColors.bgWarning.withOpacity(0.2);
      case BTMailCardState.sent:
        return BTColors.bgSuccess.withOpacity(0.2);
      case BTMailCardState.failed:
        return BTColors.bgError.withOpacity(0.2);
    }
  }

  Color get borderColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.neutral90;
      case BTMailCardState.pending:
        return BTColors.warning;
      case BTMailCardState.sent:
        return BTColors.success;
      case BTMailCardState.failed:
        return BTColors.error;
    }
  }

  Color get textColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.neutral90;
      case BTMailCardState.pending:
        return BTColors.warning;
      case BTMailCardState.sent:
        return BTColors.success;
      case BTMailCardState.failed:
        return BTColors.error;
    }
  }

  String get name {
    switch (this) {
      case BTMailCardState.draft:
        return 'Draft';
      case BTMailCardState.pending:
        return 'Open';
      case BTMailCardState.sent:
        return 'Done';
      case BTMailCardState.failed:
        return 'Failed';
    }
  }
}
