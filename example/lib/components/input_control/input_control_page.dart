/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-15 19:41:52
/// @modify date 2023-04-15 19:41:52
/// @desc

import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

import 'checkbox/checkbox_page.dart';
import 'pinput/pinput_page.dart';
import 'radio/radio_page.dart';
import 'text/text_field_page.dart';

class InputControlPage extends StatelessWidget {
  const InputControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Input Control'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Components */
              _Button(name: 'Checkbox', page: CheckboxPage()),
              _Button(name: 'Radio', page: RadioPage()),
              // _Button(name: 'Spin Button', page: SpinBoxPage()),
              _Button(name: 'Pinput Field', page: PinputPage()),
              _Button(name: 'Text Field', page: TextFieldPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.name, required this.page});

  final String name;
  final Widget page;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        child: BTButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => page),
            );
          },
          label: name,
          // disabled: true,
        ),
      );
}
