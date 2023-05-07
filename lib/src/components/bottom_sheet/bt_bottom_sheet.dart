/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 20:57:56
/// @modify date 2023-04-12 20:57:56
/// @desc

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTBottomSheet extends StatelessWidget {
  const BTBottomSheet({
    super.key,
    required this.child,
    this.height,
    this.hasHorizontalPadding = true,
    this.withHandle = true,
    this.isTransparent = false,
  });

  /// If you want to make it scrollable,use [DraggableScrollableSheet]
  final Widget child;
  final double? height;
  final bool hasHorizontalPadding;
  final bool withHandle;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                    color:
                        isTransparent ? Colors.transparent : BTColors.bgDefault,
                  ),
                  padding: EdgeInsets.only(
                    top: withHandle ? 32.h : 24.h,
                    left: hasHorizontalPadding ? 20.w : 0.w,
                    right: hasHorizontalPadding ? 20.w : 0.w,
                    bottom: 16.h,
                  ),
                  child: child,
                ),
                if (withHandle)
                  Positioned(
                    top: 16.h,
                    width: 1.sw,
                    child: Center(
                      child: Container(
                        width: 48.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: BTColors.neutral50,
                        ),
                      ),
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
