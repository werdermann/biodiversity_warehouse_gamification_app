import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Show onboarding!'),
            ],
          ),
        ),
      ),
    );
  }
}
