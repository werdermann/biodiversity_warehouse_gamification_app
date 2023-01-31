import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ResultPage());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESULT.AWESOME'.tr(),
                style: textTheme.titleLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              Text("RESULT.REPORT_SUCCESS".tr()),
              Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('RESULT.BACK'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
