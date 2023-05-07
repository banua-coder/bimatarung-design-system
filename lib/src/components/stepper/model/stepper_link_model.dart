class StepperLinkModel {
  final String caption;
  final Function()? onTap;
  final int showOnIndex;

  StepperLinkModel({
    required this.caption,
    required this.onTap,
    required this.showOnIndex,
  });

  bool getShowIndex(int index) => showOnIndex == index;
}
