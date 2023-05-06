/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 14:18:56
/// @modify date 2023-04-12 14:18:56
/// @desc

import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    var btColors = Theme.of(context).extension<BTThemeColor>()!;
    var names = btColors
        .toString()
        .replaceAll('BTThemeColor(', '')
        .replaceAll(')', '')
        .split(', ');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Colors'),
      ),
      body: ListView(
        children: List.generate(
          colorsCollection(btColors).length,
          (index) {
            var color = colorsCollection(btColors)[index];
            var name = names[index].split(': ')[0];

            return ListTile(
              tileColor: color,
              title: SelectableText(
                '$color - $name',
                style: BTTextStyle.heading(
                  color: color == BTColors.neutral100 ||
                          color == BTColors.primary ||
                          color == BTColors.primaryDarker ||
                          color == BTColors.neutral60 ||
                          color == BTColors.warningDarker ||
                          color == BTColors.secondary ||
                          color == BTColors.secondaryDarker ||
                          color == BTColors.success ||
                          color == BTColors.successDarker ||
                          color == BTColors.error ||
                          color == BTColors.errorDarker ||
                          color == BTColors.textPrice ||
                          color == BTColors.textWaitingState ||
                          color == BTColors.neutral90 ||
                          color == BTColors.neutral80 ||
                          color == BTColors.neutral70
                      ? BTColors.textPrimary
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Color?> colorsCollection(BTThemeColor btColor) => [
        btColor.primary,
        btColor.primaryDarker,
        btColor.primaryLighter,
        btColor.primarySurface,
        btColor.primaryBorder,
        btColor.secondary,
        btColor.secondarySurface,
        btColor.secondaryBorder,
        btColor.secondaryDarker,
        btColor.neutral10,
        btColor.neutral20,
        btColor.neutral30,
        btColor.neutral40,
        btColor.neutral50,
        btColor.neutral60,
        btColor.neutral70,
        btColor.neutral80,
        btColor.neutral90,
        btColor.neutral100,
        btColor.success,
        btColor.successDarker,
        btColor.error,
        btColor.errorDarker,
        btColor.warning,
        btColor.warningDarker,
        btColor.badge,
        btColor.textPrimary,
        btColor.textPrimaryBlack,
        btColor.textSecondary,
        btColor.textOnBoardingCaption,
        btColor.textInactive,
        btColor.textPlaceholder,
        btColor.textBody,
        btColor.textMain,
        btColor.textDarkBlue,
        btColor.textPrice,
        btColor.textWaitingState,
        btColor.textError,
        btColor.radioActive,
        btColor.bgDefault,
        btColor.bgSecondary,
        btColor.bgMain,
        btColor.bgError,
        btColor.bgSuccess,
        btColor.bgWarning,
        btColor.bgInfoChip,
        btColor.borderDefault,
        btColor.borderInput,
        btColor.borderSuccess,
        btColor.borderError,
      ];
}
