/// @author Fajrian Aidil Pratama
/// @email fajrianaidilp@gmail.com
/// @create date 2023-04-16 03:09:11
/// @modify date 2023-04-16 03:09:11
/// @desc

import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final form = FormGroup({
    'gender': FormControl<String?>(),
  });

  final tools = [
    {'label': 'Infus', 'icon': 'infus'},
    {'label': 'NGT (Nasogastric Tube)', 'icon': 'ngt'},
    {'label': 'Kateter Urin', 'icon': 'cvp'},
    {'label': 'Oksigen', 'icon': 'oxygen'},
    {'label': 'Nebulizer', 'icon': 'nebullizer'},
    {'label': 'Trakeostomi', 'icon': 'taracheostomy'},
    {'label': 'Suction', 'icon': 'suction'},
    {'label': 'Ventilator', 'icon': 'ventilator'},
    {'label': 'Kolostomi', 'icon': 'colostomy'},
  ];

  String? selectedValue;

  String? selectedGender;

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Radio Button'),
      ),
      body: Column(
        children: [
          ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                BTRadio<String?>(
                  label: 'Pria',
                  formControl: form.control('gender'),
                  value: 'Laki-Laki',
                ),
                BTRadio<String?>(
                  label: 'Wanita',
                  formControl: form.control('gender'),
                  value: 'Perempuan',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BTButton(
                    label: 'Show Radio List Tile',
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        enableDrag: true,
                        builder: (ctx) => DraggableScrollableSheet(
                          maxChildSize: 0.8,
                          minChildSize: 0.5,
                          snap: true,
                          builder: (_, scrollController) => BTBottomSheet(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Alat Bantu Medis'),
                                8.verticalSpace,
                                Expanded(
                                  child: StatefulBuilder(
                                    builder: (ctx, setStateInner) =>
                                        ListView.separated(
                                      itemCount: tools.length,
                                      controller: scrollController,
                                      itemBuilder: (_, index) {
                                        var tool = tools[index];
                                        return BTRadioListTile<String?>(
                                          onChanged: (value) {
                                            setStateInner(
                                              () {
                                                selectedValue = value;
                                              },
                                            );
                                          },
                                          groupValue: selectedValue,
                                          value: tool['label'],
                                          secondary: const Icon(
                                            Icons.medical_information,
                                            color: BTColors.primary,
                                          ),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tool['label'] ?? '',
                                                style: BTTextStyle.body(
                                                  color: BTColors.textSecondary,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Flexible(
                                                child: FittedBox(
                                                  child: Text(
                                                    'Semi Medis',
                                                    style: BTTextStyle.caption(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: BTColors
                                                          .secondaryDarker,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          const Divider(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
