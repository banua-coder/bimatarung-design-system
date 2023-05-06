import '../../../core/assets/gen/assets.gen.dart';

enum BTLogo {
  sulteng;

  String get path {
    var logo = Assets.logo;
    switch (this) {
      case BTLogo.sulteng:
        return logo.sulteng.path;
    }
  }
}
