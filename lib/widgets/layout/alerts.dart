import 'package:flutter/material.dart';

class Alerts {
  static Future confirmDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String confirmText,
      required Function onConfirm}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(confirmText),
            )
          ],
        );
      },
    );
  }
}
