import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung Buttons'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20.r),
          children: [
            /* Primary */
            _Child(
              title: 'Type: Primary',
              buttons: [
                BTButton(
                  label: 'This is Big Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.big,
                ),
                BTButton(
                  disabled: true,
                  label: 'This is Disabled Button',
                  onPressed: _onPressed,
                ),
                BTButton(
                  label: 'This is Normal Button',
                  onPressed: _onPressed,
                ),
                BTButton(
                  label: 'This is Small Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.small,
                ),
              ],
            ),
            /* Outline */
            _Child(
              title: 'Type: Secondary',
              buttons: [
                BTButton(
                  label: 'This is Big Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.big,
                  type: BTButtonType.secondary,
                ),
                BTButton(
                  disabled: true,
                  label: 'This is Disabled Button',
                  onPressed: _onPressed,
                  type: BTButtonType.secondary,
                ),
                BTButton(
                  label: 'This is Normal Button',
                  onPressed: _onPressed,
                  type: BTButtonType.secondary,
                ),
                BTButton(
                  label: 'This is Small Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.small,
                  type: BTButtonType.secondary,
                ),
              ],
            ),
            /* Ghost */
            _Child(
              title: 'Type: Ghost',
              buttons: [
                BTButton(
                  label: 'This is Big Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.big,
                  type: BTButtonType.ghost,
                ),
                BTButton(
                  disabled: true,
                  label: 'This is Disabled Button',
                  onPressed: _onPressed,
                  type: BTButtonType.ghost,
                ),
                BTButton(
                  label: 'This is Normal Button',
                  onPressed: _onPressed,
                  type: BTButtonType.ghost,
                ),
                BTButton(
                  label: 'This is Small Button',
                  onPressed: _onPressed,
                  size: BTButtonSize.small,
                  type: BTButtonType.ghost,
                ),
              ],
            ),
          ],
        ),
      );

  Future<void> _onPressed() async => Future.delayed(const Duration(seconds: 2));
}

class _Child extends StatelessWidget {
  const _Child({
    required this.title,
    required this.buttons,
  });

  final String title;
  final List<BTButton> buttons;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Title */
          Text(
            title,
            style: BTTextStyle.heading(
              fontWeight: FontWeight.w500,
            ),
          ),
          16.verticalSpace,
          /* Buttons */
          ...buttons
              .map(
                (button) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: button,
                ),
              )
              .toList(),
          32.verticalSpace,
        ],
      );
}
