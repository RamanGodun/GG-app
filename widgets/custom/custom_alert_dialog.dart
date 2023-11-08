import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';

class CustomAlertDialog extends StatefulWidget {
  final bool isConfirmation;
  final String? text;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Function()? onConfirm;

  const CustomAlertDialog({
    Key? key,
    required this.isConfirmation,
    this.text,
    this.onConfirm,
    this.confirmButtonText,
    this.cancelButtonText,
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              widget.isConfirmation == false
                  ? SizedBox(
                      height: 100,
                      child: Center(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          AnimatedContainer(
                            width: 60,
                            height: 60,
                            duration: const Duration(seconds: 10),
                            curve: Curves.easeInOutQuint,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.amber,
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: widget.onConfirm,
                                child: const IconAnimated(
                                  color: Colors.amber,
                                  active: true,
                                  size: 55,
                                  iconType: IconType.check,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  : SizedBox(
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: widget.onConfirm,
                              child: Text(
                                widget.confirmButtonText ?? 'Так',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                widget.cancelButtonText ?? 'Ні',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
