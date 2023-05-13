import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

class PinputPage extends StatefulWidget {
  const PinputPage({super.key});

  @override
  State<PinputPage> createState() => _PinputPageState();
}

class _PinputPageState extends State<PinputPage> {
  final TextEditingController tokenController = TextEditingController();

  @override
  void dispose() {
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bimatarung Pinput Field'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          BTPinput(
            controller: tokenController,
          ),
        ],
      ),
    );
  }
}
