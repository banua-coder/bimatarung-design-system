import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class MailCardPage extends StatelessWidget {
  const MailCardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: BTColors.bgMain,
        appBar: AppBar(
          title: const Text('Bimatarung Mail Card Components'),
        ),
        body: ListView.separated(
          itemBuilder: (_, index) {
            var state = BTMailCardState.values[index];
            return BTMailCard(
              title: 'Dinas Pertanian - Permohonan Perizinan Pembangunan lahan',
              mailNumber: '20/sppid/2023/03.12/kvi',
              createdAt: '10 Mar 2023, 10:23',
              state: state,
              onTap: () {},
            );
          },
          separatorBuilder: (_, __) => 8.verticalSpace,
          itemCount: BTMailCardState.values.length,
          shrinkWrap: true,
        ),
      );
}
