import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTNotificationCard extends StatelessWidget {
  const BTNotificationCard({
    super.key,
    required this.isRead,
    required this.title,
    required this.content,
    required this.createdAt,
    this.onTap,
  });

  final bool isRead;
  final String title;
  final String content;
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
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      size: 12.r,
                      color: BTColors.textInactive,
                    ),
                    4.horizontalSpace,
                    Text(
                      createdAt,
                      style: BTTextStyle.note(
                        color: BTColors.textInactive,
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Text(
                  title,
                  style: BTTextStyle.bodySmall(
                    fontWeight: FontWeight.w700,
                    color: isRead
                        ? BTColors.textInactive
                        : BTColors.textPrimaryBlack,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                Text(
                  content,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: BTTextStyle.note(
                    color: BTColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
