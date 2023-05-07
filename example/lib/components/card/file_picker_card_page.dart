import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class FilePickerCardPage extends StatelessWidget {
  const FilePickerCardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('File Picker Cards'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20.r),
          children: [
            const Text(
              'Empty State',
            ),
            8.verticalSpace,
            BTFilePickerCard(
              onSelect: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      content: BTSnackbar(message: 'Pilih file'),
                    ),
                  );
              },
            ),
            16.verticalSpace,
            const Text(
              'Has File State',
            ),
            8.verticalSpace,
            BTFilePickerCard(
              fileName: 'Surat-Disposisi-Tugas.pdf',
              fileSize: '2.5 MB',
              onUpdate: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      content: BTSnackbar(
                        message: 'Update file',
                        state: BTSnackbarState.warning,
                      ),
                    ),
                  );
              },
              onDelete: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      content: BTSnackbar(
                        message: 'Hapus file',
                        state: BTSnackbarState.failed,
                      ),
                    ),
                  );
              },
            ),
            16.verticalSpace,
          ],
        ),
      );
}
