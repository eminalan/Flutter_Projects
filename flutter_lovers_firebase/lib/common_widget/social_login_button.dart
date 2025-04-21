// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double fontSize;
  final double yukseklik;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.buttonText,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    this.radius = 16,
    this.fontSize = 16,
    this.yukseklik = 55,
    required this.buttonIcon,
    required this.onPressed,
  }) : assert(buttonText != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: yukseklik,
      child: TextButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        label: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: buttonIcon,
      ),
    );
  }
}
