import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BADGES.BADGES'.tr())),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Text('Badges'),
            ],
          ),
        ),
      ),
    );
  }
}
