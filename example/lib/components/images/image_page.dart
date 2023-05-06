import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung Images'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 32.h,
            left: 20.w,
            right: 20.w,
            bottom: 32.h,
          ),
          children: BTImages.values
              .map((e) => Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: BTColors.bgDefault,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: BTColors.appBarShadow.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: BTAsset(
                            fit: BoxFit.contain,
                            image: e,
                            type: BTAssetType.images,
                            width: 0.3.sw,
                            height: 0.3.sw,
                          ),
                        ),
                        8.verticalSpace,
                        FittedBox(
                          child: SelectableText(
                            e.name,
                            style: BTTextStyle.bodySmall(),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );
}
