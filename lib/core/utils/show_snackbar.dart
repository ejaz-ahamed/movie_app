import 'package:flutter/material.dart';

final class SnackbarUtils {
  static void showSnackBar(BuildContext context, String? message) {
    if (message == null) {
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}