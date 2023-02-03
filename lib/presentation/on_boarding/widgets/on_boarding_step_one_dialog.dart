import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingStepOneDialog extends StatelessWidget {
  const OnBoardingStepOneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ON_BOARDING.INTRODUCTION'.tr(), style: textTheme.titleMedium),
            Text('ON_BOARDING.DIALOG_1'.tr()),
            const SizedBox(height: 8),
            Text(
                "Als Beispiel verwenden wir ein Eichhörnchen, dass wir auf einem Baum gefunden haben"),
            Column(
              children: [
                Text(
                    "- Art: Die Art der Spezies in diesem Fall ein Eichhörnchen"),
                Text("- Status: Lebendig"),
                Text("- Anzahl: Die Anzahl der Eichhörnchen in diesem Fall 1"),
                Text('- Artkommentar: Ein spezieller Kommentar für die Art')
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('GENERAL.CONTINUE'.tr()),
        ),
      ],
    );
  }
}
