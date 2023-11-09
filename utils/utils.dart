import 'package:flutter/material.dart';
// import '../widgets/custom/custom_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HelperMethods {
  // static void showSnackBar(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     CustomSnackBar(
  //       context: context,
  //       text: content,
  //     ),
  //   );
  // }

  static void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<bool> checkInternetConnectivity(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternetConnection = connectivityResult != ConnectivityResult.none;

    if (!hasInternetConnection) {
      scaffoldContext.showSnackBar(
        const SnackBar(
          content: Text('Немає з\'єднання з Інтернетом'),
          duration: Duration(seconds: 3),
        ),
      );
    }
    return hasInternetConnection;
  }

  static Future<void> showCustomDialog({
    required BuildContext context,
    required Widget content,
  }) async {
    return showDialog(
        context: context,
        builder: (context) {
          return content;
        });
  }
}
