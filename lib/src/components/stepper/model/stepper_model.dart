import 'stepper_link_model.dart';

class StepperModel {
  final List<String> title;
  final List<String> date;
  final List<String> description;
  final StepperLinkModel? link;
  final List<String> typeStatus;

  StepperModel({
    required this.date,
    required this.title,
    required this.description,
    required this.typeStatus,
    this.link,
  });

  int getIndexValue(String currentStatus) =>
      typeStatus.indexWhere((element) => element == currentStatus) > 0
          ? typeStatus.indexWhere((element) => element == currentStatus)
          : 0;
}
