/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-05-07 16:25:58
/// @modify date 2023-05-07 16:25:58
/// @desc

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTFilePickerCard extends StatelessWidget {
  const BTFilePickerCard({
    super.key,
    this.fileName,
    this.fileSize,
    this.onSelect,
    this.onUpdate,
    this.onDelete,
    this.placeholder = 'Pilih file untuk diunggah!',
  });

  final String? fileName;
  final String? fileSize;
  final String placeholder;
  final GestureTapCallback? onSelect;
  final GestureTapCallback? onUpdate;
  final GestureTapCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: BTColors.primary,
      radius: Radius.circular(8.r),
      child: Material(
        color: BTColors.primaryLighter,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: fileName != null && fileSize != null ? onUpdate : onSelect,
          splashColor: BTColors.primaryDarker.withOpacity(0.3),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: fileName == null && fileSize == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.upload_file_rounded,
                          color: BTColors.primaryDarker,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        placeholder,
                        style: BTTextStyle.bodySmall(
                          color: BTColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      const Icon(
                        Icons.file_present_rounded,
                        color: BTColors.primaryDarker,
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName ?? '',
                              style: BTTextStyle.body(
                                fontWeight: FontWeight.w700,
                                color: BTColors.primaryDarker,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            4.verticalSpace,
                            Text(
                              fileSize ?? '',
                              style: BTTextStyle.caption(
                                fontWeight: FontWeight.w500,
                                color: BTColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      8.horizontalSpace,
                      IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete,
                          color: BTColors.error,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
