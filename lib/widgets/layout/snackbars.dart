import 'package:flutter/material.dart';

class Snackbars {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> info(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
