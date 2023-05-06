/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-12 16:56:00
/// @modify date 2023-04-12 16:56:00
/// @desc
import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Text Style'),
      ),
      body: ListView.separated(
        itemCount: _textStyles.length,
        padding: EdgeInsets.all(20.r),
        itemBuilder: (context, index) => _textStyles[index],
        separatorBuilder: (context, index) => Container(
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 16.h),
          color: BTColors.borderDefault,
        ),
      ),
    );
  }

  static final _textStyles = [
    SelectableText(
      'Title1',
      style: BTTextStyle.title1(),
    ),
    SelectableText(
      'Title2',
      style: BTTextStyle.title2(),
    ),
    SelectableText(
      'Title3',
      style: BTTextStyle.title3(),
    ),
    SelectableText(
      'Title4',
      style: BTTextStyle.title4(),
    ),
    SelectableText(
      'Heading',
      style: BTTextStyle.heading(),
    ),
    SelectableText(
      'Subheading',
      style: BTTextStyle.subHeading(),
    ),
    SelectableText(
      'Body',
      style: BTTextStyle.body(),
    ),
    SelectableText(
      'Body Small',
      style: BTTextStyle.bodySmall(),
    ),
    SelectableText(
      'Number Small',
      style: BTTextStyle.numberSmall(),
    ),
    SelectableText(
      'Caption',
      style: BTTextStyle.caption(),
    ),
    SelectableText(
      'Note',
      style: BTTextStyle.note(),
    ),
  ];
}
