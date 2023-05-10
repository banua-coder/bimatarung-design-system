import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';
import 'enum/bt_file_picker_state.dart';

class BTFilePickerCard extends StatefulWidget {
  const BTFilePickerCard({
    super.key,
    this.fileName,
    this.fileSize,
    this.onSelect,
    this.onUpdate,
    this.onDelete,
    this.errorMessage = 'Tidak ada file yang dipilih!',
    this.placeholder = 'Pilih file untuk diunggah!',
  });

  final String? fileName;
  final String? fileSize;
  final String placeholder;
  final String errorMessage;
  final Future Function()? onSelect;
  final Future Function()? onUpdate;
  final Future Function()? onDelete;

  @override
  State<BTFilePickerCard> createState() => _BTFilePickerCardState();
}

class _BTFilePickerCardState extends State<BTFilePickerCard> {
  final ValueNotifier<BTFilePickerState> _state =
      ValueNotifier(BTFilePickerState.idle);
  final ValueNotifier<bool> _isTouched = ValueNotifier(false);

  @override
  void initState() {
    _checkState();
    super.initState();
  }

  void _checkState() {
    _state.value = !_isTouched.value
        ? widget.fileName == null && widget.fileSize == null
            ? BTFilePickerState.idle
            : BTFilePickerState.valid
        : widget.fileName == null && widget.fileSize == null
            ? BTFilePickerState.invalid
            : BTFilePickerState.valid;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isTouched,
      builder: (_, __, ___) => ValueListenableBuilder(
        valueListenable: _state,
        builder: (_, value, __) => DottedBorder(
          borderType: BorderType.RRect,
          color: value.style.borderColor,
          radius: Radius.circular(8.r),
          child: Material(
            color: value.style.bgColor,
            borderRadius: BorderRadius.circular(8.r),
            child: InkWell(
              onTap: () async {
                widget.fileName != null && widget.fileSize != null
                    ? await widget.onUpdate?.call()
                    : await widget.onSelect?.call();
                _checkState();
              },
              onTapUp: (details) {
                _isTouched.value = true;
                _checkState();
              },
              splashColor: value.style.splashColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: value == BTFilePickerState.idle ||
                        value == BTFilePickerState.invalid
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.upload_file_rounded,
                              color: value.style.foregroundColor,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            value == BTFilePickerState.invalid
                                ? widget.errorMessage
                                : widget.placeholder,
                            style: BTTextStyle.bodySmall(
                              color: value.style.foregroundColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.file_present_rounded,
                            color: value.style.foregroundColor,
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.fileName ?? '',
                                  style: BTTextStyle.body(
                                    fontWeight: FontWeight.w700,
                                    color: value.style.foregroundColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                4.verticalSpace,
                                Text(
                                  widget.fileSize ?? '',
                                  style: BTTextStyle.caption(
                                    fontWeight: FontWeight.w500,
                                    color: value.style.foregroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          8.horizontalSpace,
                          IconButton(
                            onPressed: () async {
                              await widget.onDelete?.call();
                              _checkState();
                            },
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
        ),
      ),
    );
  }
}
