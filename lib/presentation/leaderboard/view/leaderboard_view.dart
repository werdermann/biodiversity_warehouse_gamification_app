import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeaderboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEADERBOARD.LEADERBOARD'.tr()),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Leaderboard"),

              // TODO: Show leaderboard here
            ],
          ),
        ),
      ),
    );
  }
}
