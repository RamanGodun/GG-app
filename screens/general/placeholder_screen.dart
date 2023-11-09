import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final int number;

  const PlaceholderScreen({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Text(
          "This is screen PlaceholderScreen $number",
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
      ),
    );
  }
}
