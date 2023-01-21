import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fund melden"),
      ),
      body: Column(
        children: [
          Text('Fund melden'),
        ],
      ),
    );
  }
}
