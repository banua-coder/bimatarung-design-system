import '../../../../bimatarung_design_system.dart';

enum BTButtonSize {
  big(48),
  normal(44),
  small(36);

  final double _height;

  const BTButtonSize(this._height);

  double get height => _height * 1.h;
}
