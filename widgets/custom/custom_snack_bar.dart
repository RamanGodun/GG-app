import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String? text;

  CustomSnackBar({super.key, this.text, required BuildContext context})
      : super(
          content: Text(text!,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center),
          duration: const Duration(seconds: 3),
        );
}
