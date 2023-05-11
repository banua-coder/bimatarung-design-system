/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 23:01:09
/// @modify date 2023-04-16 23:01:09
/// @desc

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';

/// This is a component initialization for Bima Tarung Component.
/// Make sure to use this class as a parent of your [MaterialApp] widget.
class BTComponentInit extends StatelessWidget {
  const BTComponentInit({super.key, required this.builder});

  final Widget Function() builder;

  @override
  Widget build(BuildContext context) => MediaQuery(
        data: MediaQueryData.fromView(WidgetsBinding.instance.window),
        child: LayoutBuilder(
          builder: (_, constraints) {
            if (constraints.maxWidth != 0) {
              ScreenUtil.init(
                _,
                designSize: Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
              );
              return builder();
            }
            return nil;
          },
        ),
      );
}
