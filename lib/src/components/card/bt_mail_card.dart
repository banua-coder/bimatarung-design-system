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
  });

  final BTMailCardState state;
  final String title;
  final String mailNumber;
  final String createdAt;
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
                          size: 14.r,
                          color: BTColors.textSecondary,
                        ),
                        4.horizontalSpace,
                        Text(
                          createdAt,
                          style: BTTextStyle.bodySmall(
                            color: BTColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: state.bgColor,
                        border: Border.all(
                          color: state.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      child: Text(
                        state.name,
                        style: BTTextStyle.caption(
                          color: state.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Text(
                  title,
                  style: BTTextStyle.title4(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                16.verticalSpace,
                Text(
                  mailNumber.toUpperCase(),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BTTextStyle.body(
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
