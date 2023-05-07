import 'dart:developer';

import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final _occupancies = [
    'Pegawai Swasta',
    'Pegawai Negeri',
    'Ibu Rumah Tangga',
    'Pengusaha',
    'Pelajar/Mahasiswa',
    'TNI/Polri',
    'Pensiunan',
    'Guru',
    'Konsultan',
    'Factory',
    'Dokter',
    'Pengacara',
    'Akuntan',
    'Reporter',
    'Artis',
    'Jaksa',
    'Pejabat Negara/Daerah',
    'Konsultan Hukum',
    'Pejabat Senior',
    'Pengurus Ormas',
    'Politisi Senior',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheet Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          BTButton(
            label: 'Show Simple Bottom Sheet',
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                enableDrag: true,
                builder: (context) => const BTBottomSheet(
                  height: 300,
                  child: Text('This is Single item with custom height.'),
                ),
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          BTButton(
            label: 'Show Scrolled Bottom Sheet',
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                enableDrag: true,
                builder: (context) => BTBottomSheet(
                  child: DraggableScrollableSheet(
                    maxChildSize: 0.8,
                    minChildSize: 0.2,
                    expand: false,
                    builder: (context, scrollController) => FooterLayout(
                      footer: Container(
                        padding: EdgeInsets.all(16.r),
                        child: BTButton(
                          label: 'Lanjutkan',
                          onPressed: () async {
                            log('Pressed');
                          },
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: _occupancies
                            .map(
                              (e) => ListTile(
                                title: Text(e),
                                onTap: () => log('Selected: $e'),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          BTButton(
            label: 'Example Bottom Sheet Menu',
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                enableDrag: true,
                builder: (context) => BTBottomSheet(
                  height: 0.3.sh,
                  hasHorizontalPadding: false,
                  child: FooterLayout(
                    footer: Container(
                      padding: EdgeInsets.only(
                        right: 16.w,
                        left: 16.w,
                        top: 16.h,
                      ),
                      decoration: const BoxDecoration(
                        color: BTColors.bgDefault,
                        border: Border(
                          top: BorderSide(
                            color: BTColors.neutral30,
                          ),
                        ),
                      ),
                      child: BTButton(
                        type: BTButtonType.ghost,
                        label: 'Batal',
                        labelColor: BTColors.textPrimaryBlack,
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          onTap: () {
                            log('Pressed');
                          },
                          leading: const Icon(
                            Icons.share,
                          ),
                          title: Text(
                            'Bagikan',
                            style: BTTextStyle.body(),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            log('Pressed');
                          },
                          leading: const Icon(
                            Icons.warning_rounded,
                          ),
                          title: Text(
                            'Laporkan',
                            style: BTTextStyle.body(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
