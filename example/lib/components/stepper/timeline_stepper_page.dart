import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class TimelineStepperPage extends StatefulWidget {
  const TimelineStepperPage({super.key});

  @override
  State<TimelineStepperPage> createState() => _TimelineStepperPageState();
}

class _TimelineStepperPageState extends State<TimelineStepperPage> {
  int index = 0;
  List<StepperModel> _stepper() => [
        StepperModel(
          date: ['10 Apr 2023, 11:00'],
          title: ['Berkas diteruskan ke pada Sekretaris'],
          description: [
            'Lorem ipsum dolor sit amet consectetur. Non eget auctor enim id. Lectus porta rhoncus habitasse ut congue volutpat ornare erat magnis. At netus at adipiscing laoreet vitae.',
          ],
          typeStatus: ['queued'],
        ),
        StepperModel(
          date: [
            '10 Mei 2023, 11:00',
            '10 Mei 2023, 12:23',
          ],
          title: [
            'Berkas Diterima oleh Sekretaris dan diteruskan ke Kepala Dinas',
            'Berkas Ditolak oleh Sekretaris'
          ],
          description: [
            'Lorem ipsum dolor sit amet consectetur. Non eget auctor enim id. Lectus porta rhoncus habitasse ut congue volutpat ornare erat magnis. At netus at adipiscing laoreet vitae.',
            'Disposisi ditolak!',
          ],
          typeStatus: ['approved', 'rejected'],
          link: StepperLinkModel(
            caption: 'View on explorer',
            onTap: () {},
            showOnIndex: 0,
          ),
        ),
        StepperModel(
          date: [
            '10 Mei 2023, 13:01',
          ],
          title: [
            'Berkas Diterima oleh Kadis dan diteruskan ke Bidang Jalan dan Jembatan',
          ],
          description: [
            'Lorem ipsum dolor sit amet consectetur. Non eget auctor enim id. Lectus porta rhoncus habitasse ut congue volutpat ornare erat magnis. At netus at adipiscing laoreet vitae.',
          ],
          typeStatus: ['processing'],
        ),
        StepperModel(
          date: [
            '10 Mei 2023, 14:20',
            '10 Mei 2023, 14:45',
            '10 Mei 2023, 15:25',
          ],
          title: [
            'Berkas Diterima oleh Kadis dan diteruskan ke Bidang Jalan dan Jembatan',
            'Berkas Diterima oleh Kepala Bidang Jalan dan Jembatan dan diteruskan ke Kepala seksi Jalan',
            'Berkas Diterima oleh Kepala Seksi Jalan.',
          ],
          description: [
            'Lorem ipsum dolor sit amet consectetur. Non eget auctor enim id. Lectus porta rhoncus habitasse ut congue volutpat ornare erat magnis. At netus at adipiscing laoreet vitae.',
            'Menunggu disposisi Kepala Bidang ke Kepala Seksi',
            'Ditolak oleh Kepala Seksi Jalan.',
          ],
          typeStatus: ['completed', 'pending', 'failed'],
          link: StepperLinkModel(
            caption: 'Coba hubungi yang bersangkutan',
            onTap: () {},
            showOnIndex: 0,
          ),
        ),
      ];

  BTStepperStatus _lastStatus(String currentStatus) {
    if (currentStatus == 'failed' || currentStatus == 'rejected') {
      return BTStepperStatus.failed;
    } else if (currentStatus == 'pending' ||
        currentStatus == 'processing' ||
        currentStatus == 'queued') {
      return BTStepperStatus.pending;
    } else {
      return BTStepperStatus.completed;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung Timeline Stepper'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Expanded(
                child: BTTimelineStepper(
                  title: 'Riwayat disposisi',
                  currentStatus: _allCaseStatus[index],
                  progressListStatus: _stepper(),
                  lastStatus: _lastStatus(_allCaseStatus[index]),
                ),
              ),
              BTButton(
                label: 'Next',
                onPressed: () async {
                  if (index == _allCaseStatus.length - 1) {
                    index = 0;
                  } else {
                    index++;
                  }
                  setState(() {});
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      );

  final List<String> _allCaseStatus = [
    'queued',
    'approved',
    'rejected',
    'processing',
    'completed',
    'pending',
    'failed',
  ];
}
