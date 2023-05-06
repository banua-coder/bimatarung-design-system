import '../../../core/assets/gen/assets.gen.dart';

enum BTImages {
  onBoarding1,
  onBoarding2,
  onBoarding3,
  onBoarding4;

  String get path {
    var images = Assets.images;
    switch (this) {
      case BTImages.onBoarding1:
        return images.onboarding1.path;
      case BTImages.onBoarding2:
        return images.onboarding2.path;
      case BTImages.onBoarding3:
        return images.onboarding3.path;
      case BTImages.onBoarding4:
        return images.onboarding4.path;
    }
  }
}
