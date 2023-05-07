import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  final FormGroup form = FormGroup({
    'education': FormControl<bool>(),
  });

  final List<String> diseases = [
    'Tidak Ada',
    'Jantung & Pembuluh Darah',
    'TBC/Bronchitis/Radang Paru',
    'Maag & Gangguan Lambung',
    'Gangguan Ginjal/Saluran Kencing',
    'Ayan/Epilepsi',
    'Infkesi Lain Akibat Seks',
    'Asma',
    'Kanker',
    'Ambeien',
  ];
  final List<String> selectedDiseases = [];

  void itemChange(String item, bool isSelected) {
    if (isSelected) {
      selectedDiseases.add(item);
    } else {
      selectedDiseases.remove(item);
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Check Boxes'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 35.h,
            left: 20.w,
            right: 20.w,
            bottom: 32.h,
          ),
          children: [
            BTCheckbox(
              label: 'S1',
              formControl: form.control('education'),
              onChange: (value) {},
            ),
            BTCheckbox(
              label: 'S2',
              formControl: form.control('education'),
              onChange: (value) {},
            ),
            8.verticalSpace,
            BTButton(
              label: 'Show Checkbox ListTile',
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  enableDrag: true,
                  builder: (context) => DraggableScrollableSheet(
                    minChildSize: 0.5,
                    maxChildSize: 0.8,
                    snap: true,
                    builder: (_, scrollController) => BTBottomSheet(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Riwayat penyakit!'),
                          Expanded(
                            child:
                                StatefulBuilder(builder: (ctx, setStateInner) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                controller: scrollController,
                                itemCount: diseases.length,
                                itemBuilder: (context, index) {
                                  var item = diseases[index];
                                  return BTCheckboxListTile(
                                    title: Text(
                                      item,
                                      style: BTTextStyle.body(),
                                    ),
                                    onChange: (value) {
                                      setStateInner.call(
                                        () => itemChange(
                                          item,
                                          value!,
                                        ),
                                      );
                                    },
                                    value: selectedDiseases.contains(item),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
