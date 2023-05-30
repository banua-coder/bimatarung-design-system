import 'package:flutter/material.dart';

import '../../../../bimatarung_design_system.dart';

enum BTMailCardState {
  draft,
  sent,
  pending,
  open,
  disposition,
  done;

  Color get bgColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.bgDefault;
      case BTMailCardState.pending:
      case BTMailCardState.open:
      case BTMailCardState.sent:
        return BTColors.bgError.withOpacity(0.2);
      case BTMailCardState.disposition:
      case BTMailCardState.done:
        return BTColors.bgSuccess.withOpacity(0.2);
    }
  }

  Color get borderColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.neutral90;
      case BTMailCardState.pending:
      case BTMailCardState.sent:
      case BTMailCardState.open:
        return BTColors.error;
      case BTMailCardState.disposition:
      case BTMailCardState.done:
        return BTColors.success;
    }
  }

  Color get textColor {
    switch (this) {
      case BTMailCardState.draft:
        return BTColors.neutral90;
      case BTMailCardState.pending:
      case BTMailCardState.open:
      case BTMailCardState.sent:
        return BTColors.error;
      case BTMailCardState.disposition:
      case BTMailCardState.done:
        return BTColors.success;
    }
  }

  String get name {
    switch (this) {
      case BTMailCardState.draft:
        return 'Draft';
      case BTMailCardState.pending:
        return 'Pending';
      case BTMailCardState.sent:
        return 'Sent';
      case BTMailCardState.open:
        return 'Open';
      case BTMailCardState.disposition:
        return 'Disposition';
      case BTMailCardState.done:
        return 'Done';
    }
  }
}
