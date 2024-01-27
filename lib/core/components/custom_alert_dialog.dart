import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;

  CustomAlertDialog(
      {required this.title, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
