import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../bimatarung_design_system.dart';

class BTTimelineStepper extends StatelessWidget {
  const BTTimelineStepper({
    super.key,
    required this.title,
    required this.currentStatus,
    required this.progressListStatus,
    this.lastStatus = BTStepperStatus.completed,
  });

  /// Title of the stepper
  final String title;

  /// Current status from existing progressListStatus
  final String currentStatus;

  /// List of status and wrap with [StepperModel]
  final List<StepperModel> progressListStatus;

  /// Last status enum, in this case the status has to map to enum
  /// current supported status is completed, pending, and failed.
  final BTStepperStatus lastStatus;

  int _progressListLength() {
    var length = 1;

    if (lastStatus == BTStepperStatus.failed) {
      outerloop:
      for (var stepperModel in progressListStatus) {
        for (var status in stepperModel.typeStatus) {
          if (status == currentStatus) {
            break outerloop;
          }
        }
        length += 1;
      }
      return length;
    } else {
      return progressListStatus.length;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BTTextStyle.body(),
          ),
          Expanded(
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                indicatorPosition: 0,
                nodePosition: 0,
                nodeItemOverlap: true,
                connectorTheme: const ConnectorThemeData(
                  color: BTColors.neutral20,
                  thickness: 20,
                ),
              ),
              padding: EdgeInsets.only(top: 20.h),
              builder: TimelineTileBuilder.connected(
                indicatorBuilder: (context, index) {
                  var borderColor = Colors.transparent;
                  var color = Colors.transparent;

                  if (index <
                      progressListStatus.indexWhere(
                        (element) => element.typeStatus.contains(currentStatus),
                      )) {
                    borderColor = BTColors.success;
                    color = BTColors.success;
                  } else if (index ==
                      progressListStatus.indexWhere((element) =>
                          element.typeStatus.contains(currentStatus))) {
                    if (lastStatus == BTStepperStatus.failed) {
                      borderColor = BTColors.error;
                      color = BTColors.errorDarker;
                    } else if (lastStatus == BTStepperStatus.pending) {
                      borderColor = BTColors.warning;
                      color = BTColors.warningDarker;
                    } else if (lastStatus == BTStepperStatus.completed) {
                      borderColor = BTColors.success;
                      color = BTColors.successDarker;
                    }
                  } else {
                    if (lastStatus == BTStepperStatus.completed) {
                      borderColor = BTColors.neutral40;
                      color = BTColors.neutral40;
                    } else if (lastStatus == BTStepperStatus.pending) {
                      borderColor = BTColors.neutral40;
                      color = BTColors.neutral40;
                    } else if (lastStatus == BTStepperStatus.failed) {
                      borderColor = BTColors.error;
                      color = BTColors.errorDarker;
                    }
                  }

                  return Container(
                    padding: EdgeInsets.all(6.r),
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: borderColor,
                      shape: BoxShape.circle,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
                connectorBuilder: (context, index, connectorType) {
                  Color color = Colors.transparent;

                  if (index <
                      progressListStatus.indexWhere((element) =>
                          element.typeStatus.contains(currentStatus))) {
                    color = progressListStatus[index + 1]
                                .typeStatus
                                .contains(currentStatus) &&
                            lastStatus == BTStepperStatus.failed
                        ? BTColors.error
                        : progressListStatus[index + 1]
                                    .typeStatus
                                    .contains(currentStatus) &&
                                lastStatus == BTStepperStatus.pending
                            ? BTColors.warning
                            : BTColors.success;
                  } else {
                    if (lastStatus == BTStepperStatus.completed) {
                      color = BTColors.neutral40;
                    } else if (lastStatus == BTStepperStatus.pending) {
                      color = BTColors.neutral40;
                    } else if (lastStatus == BTStepperStatus.failed) {
                      color = BTColors.bgError;
                    }
                  }
                  return SolidLineConnector(
                    thickness: 4.sp,
                    color: color,
                  );
                },
                contentsBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          progressListStatus[index]
                              .date[progressListStatus[index].getIndexValue(
                            currentStatus,
                          )],
                          style: BTTextStyle.note(
                            color: BTColors.textSecondary,
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          (index >
                                  progressListStatus.indexWhere((element) =>
                                      element.typeStatus
                                          .contains(currentStatus)))
                              ? (lastStatus == BTStepperStatus.failed)
                                  ? progressListStatus[index].title[
                                      progressListStatus[index].getIndexValue(
                                      currentStatus,
                                    )]
                                  : _getTitle(progressListStatus[index].title)
                              : progressListStatus[index].title[
                                  progressListStatus[index].getIndexValue(
                                  currentStatus,
                                )],
                          style: BTTextStyle.bodySmall(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          progressListStatus[index].description[
                              progressListStatus[index].getIndexValue(
                            currentStatus,
                          )],
                          style: BTTextStyle.note(
                            color: BTColors.textSecondary,
                          ),
                        ),
                        if (progressListStatus[index].contents.isNotEmpty) ...[
                          8.verticalSpace,
                          Wrap(
                            spacing: 4.w,
                            runSpacing: 4.h,
                            children: progressListStatus[index]
                                .contents
                                .map(
                                  (e) => Container(
                                    decoration: BoxDecoration(
                                      color: BTColors.secondarySurface,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    child: Text(
                                      e,
                                      style: BTTextStyle.note(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                        Visibility(
                          visible: _showLink(index),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: progressListStatus[index].link?.onTap,
                              child: Text(
                                progressListStatus[index].link?.caption ?? '',
                                style: const TextStyle(
                                  color: BTColors.success,
                                  decoration: TextDecoration.underline,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        24.verticalSpace,
                      ],
                    ),
                  );
                },
                itemCount: _progressListLength(),
              ),
            ),
          ),
        ],
      );

  bool _showLink(int index) {
    var isRightPosition = progressListStatus[index].link?.getShowIndex(
              progressListStatus[index].getIndexValue(currentStatus),
            ) ??
        false;
    return isRightPosition &&
        index <=
            progressListStatus.indexWhere(
              (element) => element.typeStatus.contains(currentStatus),
            );
  }

  String _getTitle(List<String> titleList) {
    var data = StringBuffer();

    for (var element in titleList) {
      data.write('$element/');
    }

    var text = data.toString().replaceRange(data.length - 1, data.length, '');

    String output = text.replaceAll(RegExp(r'\/{2,}'), '/');
    // ignore: join_return_with_assignment
    output = output.replaceAll(RegExp(r'^\/|\/$'), '');
    return output;
  }

  String _getDate(List<String> dateList) {
    var data = StringBuffer();

    for (var element in dateList) {
      data.write('$element/');
    }

    var text = data.toString().replaceRange(data.length - 1, data.length, '');

    String output = text.replaceAll(RegExp(r'\/{2,}'), '/');
    // ignore: join_return_with_assignment
    output = output.replaceAll(RegExp(r'^\/|\/$'), '');
    return output;
  }
}
