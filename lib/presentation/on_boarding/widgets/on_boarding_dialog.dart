import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingDialog extends StatelessWidget {
  const OnBoardingDialog({
    super.key,
    required this.content,
    this.index = 0,
  });

  final List<DialogContent> content;

  final int index;

  DialogContent get dialog => content[index];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialog.title.tr()),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: dialog.content,
      ),
      actions: [
        TextButton(
          onPressed: dialog.onTap,
          child: Text(dialog.buttonText.tr()),
        ),
      ],
    );
  }
}

class DialogContent {
  DialogContent({
    required this.onTap,
    required this.buttonText,
    required this.title,
    required this.content,
  });

  final VoidCallback onTap;

  final String buttonText;

  final String title;

  final Widget content;
}
