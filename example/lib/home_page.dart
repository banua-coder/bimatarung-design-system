import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

import 'components/bottom_sheet/bottom_sheet_page.dart';
import 'components/buttons/button_page.dart';
import 'components/card/file_picker_card_page.dart';
import 'components/card/mail_card_page.dart';
import 'components/card/notification_card_page.dart';
import 'components/colors/color_page.dart';
import 'components/dialog/dialog_page.dart';
import 'components/images/image_page.dart';
import 'components/input_control/input_control_page.dart';
import 'components/logo/logo_page.dart';
import 'components/snackbar/snackbar_page.dart';
import 'components/stepper/timeline_stepper_page.dart';
import 'components/text_style/text_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung UI Kit'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(
            top: 16.h,
            left: 20.w,
            right: 20.w,
            bottom: 32.h,
          ),
          shrinkWrap: true,
          children: [
            const _SectionTitle(
              title: 'Base Style',
            ),
            const _Button(name: 'Colors', page: ColorPage()),
            const _Button(name: 'Text Style', page: TextPage()),
            const _SectionTitle(
              title: 'Components',
            ),
            const _Button(name: 'Bottom Sheets', page: BottomSheetPage()),
            const _Button(name: 'Buttons', page: ButtonPage()),
            const _Button(name: 'Dialogs', page: DialogPage()),
            const _Button(name: 'File Picker Card', page: FilePickerCardPage()),
            const _Button(name: 'Images', page: ImagePage()),
            const _Button(name: 'Input Control', page: InputControlPage()),
            const _Button(name: 'Logo', page: LogoPage()),
            const _Button(name: 'Mail Cards', page: MailCardPage()),
            const _Button(
              name: 'Notifications Cards',
              page: NotificationCardPage(),
            ),
            _Button(name: 'Snackbars', page: SnackbarPage()),
            const _Button(
              name: 'Timeline Stepper',
              page: TimelineStepperPage(),
            ),
          ],
        ),
      );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: 30.h,
        ),
        child: Text(
          title,
          style: BTTextStyle.subHeading(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
        ),
      );
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
