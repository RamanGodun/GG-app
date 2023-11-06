import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/custom/custom_snack_bar.dart';
import 'package:image_picker/image_picker.dart';

class HelperMethods {
  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar(
        context: context,
        text: content,
      ),
    );
  }

  static void nextScreen(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
