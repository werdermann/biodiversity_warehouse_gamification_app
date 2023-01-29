import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(
  BuildContext context, {
  String error = 'ERROR.GENERAL',
  int duration = 3000,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(error.tr()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
}
