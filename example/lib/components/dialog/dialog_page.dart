import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung Dialog Component'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.r),
          shrinkWrap: true,
          children: [
            BTButton(
              label: 'Show Basic Dialog',
              onPressed: () async => showDialog(
                context: context,
                builder: (context) => const BTDialog(
                  title: 'Kirim Sekarang?',
                  textContent: 'Pastikan semua data sudah lengkap dan benar',
                ),
              ),
            ),
            16.verticalSpace,
            BTButton(
              label: 'Show Dialog without Close Button',
              onPressed: () async => showDialog(
                context: context,
                builder: (context) => const BTDialog(
                  title: 'Kirim Sekarang?',
                  textContent: 'Pastikan semua data sudah lengkap dan benar',
                  showCloseButton: false,
                ),
              ),
            ),
            16.verticalSpace,
            BTButton(
              label: 'Show Dialog with Custom Content',
              onPressed: () async => showDialog(
                context: context,
                builder: (context) => const BTDialog(
                  title: 'Kirim Sekarang?',
                  content: Column(
                    children: [
                      Text('Hellow'),
                    ],
                  ),
                  showCloseButton: false,
                ),
              ),
            ),
            16.verticalSpace,
            BTButton(
              label: 'Show Dialog with Buttons ',
              onPressed: () async => showDialog(
                context: context,
                builder: (context) => BTDialog(
                  title: 'Kirim Sekarang?',
                  textContent: 'Pastikan semua data sudah lengkap dan benar!',
                  buttonLeft: BTButton(
                    size: BTButtonSize.small,
                    label: 'Batal',
                    type: BTButtonType.secondary,
                    labelColor: BTColors.error,
                    forDialog: true,
                    onPressed: () async {
                      return;
                    },
                  ),
                  buttonRight: BTButton(
                    size: BTButtonSize.small,
                    label: 'Kirim',
                    forDialog: true,
                    onPressed: () async {
                      return;
                    },
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            BTButton(
              label: 'Show Dialog with Buttons and Icon',
              onPressed: () async => showDialog(
                context: context,
                builder: (context) => BTDialog(
                  title: 'Kirim Sekarang?',
                  iconBgColor: Colors.transparent,
                  icon: const Icon(
                    Icons.warning_amber_rounded,
                    color: BTColors.error,
                  ),
                  textContent: 'Pastikan semua data sudah lengkap dan benar!',
                  buttonLeft: BTButton(
                    size: BTButtonSize.small,
                    label: 'Batal',
                    type: BTButtonType.secondary,
                    labelColor: BTColors.error,
                    forDialog: true,
                    onPressed: () async {
                      return;
                    },
                  ),
                  buttonRight: BTButton(
                    size: BTButtonSize.small,
                    label: 'Kirim',
                    forDialog: true,
                    onPressed: () async {
                      return;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
