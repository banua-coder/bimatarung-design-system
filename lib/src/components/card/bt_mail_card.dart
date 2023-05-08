import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTMailCard extends StatelessWidget {
  const BTMailCard({
    super.key,
    this.state = BTMailCardState.draft,
    this.onTap,
    required this.title,
    required this.mailNumber,
    required this.createdAt,
    this.status,
  });

  final BTMailCardState state;
  final String title;
  final String mailNumber;
  final String createdAt;
  final String? status;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.card,
        color: BTColors.bgDefault,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.clock,
                          size: 12.r,
                          color: BTColors.neutral60,
                        ),
                        4.horizontalSpace,
                        Text(
                          createdAt,
                          style: BTTextStyle.note(
                            color: BTColors.neutral60,
                          ),
                        ),
                      ],
                    ),
                    BTMailStatusChip(
                      state: state,
                      label: status,
                    ),
                  ],
                ),
                12.verticalSpace,
                Text(
                  title,
                  style: BTTextStyle.bodySmall(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Text(
                  mailNumber.toUpperCase(),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BTTextStyle.note(
                    color: BTColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
