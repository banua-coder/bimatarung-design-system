import 'package:flutter/material.dart';

class BTSnackbarStyle {
  const BTSnackbarStyle({
    required this.bgColor,
    required this.textColor,
    required this.actionColor,
    this.borderColor = Colors.transparent,
  });
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final Color actionColor;
}
