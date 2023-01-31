import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BadgesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BADGES.BADGES'.tr())),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Badges'),
            ],
          ),
        ),
      ),
    );
  }
}
