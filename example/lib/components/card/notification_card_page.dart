import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class NotificationCardPage extends StatelessWidget {
  const NotificationCardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: BTColors.bgSecondary,
        appBar: AppBar(
          title: const Text('Bimatarung Notification Card'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
          ),
          children: [
            BTNotificationCard(
              isRead: false,
              title: 'Dokumen Baru, Diterima',
              content:
                  'Lorem ipsum dolor sit amet consectetur. Amet eros eleifend augue maecenas pulvinar dictum nullam turpis. Libero integer lobortis et mauris nulla nam. Sed faucibus ultrices congue dictum consequat ac. Amet felis sit tortor aenean eu.',
              createdAt: '10 Mei 2023 10:00',
              onTap: () {},
            ),
            16.verticalSpace,
            BTNotificationCard(
              isRead: true,
              title: 'Dokumen Baru, Diterima',
              content:
                  'Lorem ipsum dolor sit amet consectetur. Amet eros eleifend augue maecenas pulvinar dictum nullam turpis. Libero integer lobortis et mauris nulla nam. Sed faucibus ultrices congue dictum consequat ac. Amet felis sit tortor aenean eu.',
              createdAt: '10 Mei 2023 10:00',
              onTap: () {},
            ),
          ],
        ),
      );
}
