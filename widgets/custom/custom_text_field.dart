import 'package:flutter/material.dart';

import '../../data_management/theme_provider.dart';

enum ValidatorType { integer, double, string, phoneNumber }

class CustomTextField extends StatelessWidget {
  final int maxLength;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String? hintText;
  final String? sufixText;
  final Widget? prefix;
  final double? textSize;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool showCounterText;
  final bool showHintText;
  final bool isTextAlignCenter;
  final ValidatorType validatorType;
  final bool? allowEmpty;

  CustomTextField({
    super.key,
    required this.maxLength,
    required this.controller,
    required this.validatorType,
    this.hintText,
    this.sufixText,
    this.prefix,
    this.textSize,
    this.keyboardType,
    this.maxLines,
    this.showCounterText = false,
    this.showHintText = true,
    this.isTextAlignCenter = false,
    this.allowEmpty,
  }) : validator = _getValidatorFunction(validatorType, allowEmpty ?? false);

  static String? Function(String?)? _getValidatorFunction(
    ValidatorType type,
    bool allowEmpty,
  ) {
    switch (type) {
      case ValidatorType.integer:
        return _validateInteger;
      case ValidatorType.double:
        return _validateDouble;
      case ValidatorType.string:
        return (value) => _validateString(value, allowEmpty);
      case ValidatorType.phoneNumber:
        return _validatePhoneNumber;
      default:
        return null;
    }
  }

  static String? _validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (int.tryParse(value) == null ||
        double.tryParse(value) != null ||
        value.startsWith('-')) {
      return 'Введіть ціле число';
    }
    return null;
  }

  static String? _validateDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }

    if (double.tryParse(value) == null || value.startsWith('-')) {
      return 'Введіть додатне число';
    }
    return null;
  }

  static String? _validateString(String? value, bool allowEmpty) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : 'Це поле не може бути пустим';
    }
    return null;
  }

  static String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Це поле не може бути пустим';
    }
    final regExp = RegExp(r'^\+380[0-9]{9}$');
    if (!regExp.hasMatch('+380$value')) {
      return 'Невірний номер телефону!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHintText)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                hintText ?? '',
                style: TextStyle(
                  color: textColor.withOpacity(0.8),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsForApp.primary.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.start,
              validator: validator,
              cursorColor: textColor,
              maxLines: maxLines ?? 1,
              controller: controller,
              maxLength: maxLength,
              keyboardType: keyboardType,
              style: TextStyle(color: textColor, fontSize: textSize ?? 17),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                counterText: showCounterText ? null : '',
                counterStyle: TextStyle(color: textColor),
                border: InputBorder.none,
                prefix: prefix,
                prefixStyle: TextStyle(
                  color: textColor,
                  fontSize: textSize ?? 17,
                ),
                suffixText: sufixText,
                suffixStyle: TextStyle(
                  color: textColor,
                  fontSize: textSize ?? 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
