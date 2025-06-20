// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/button/costum_button.dart';
import 'package:flutter_application_1/core/extension/extension.dart';

enum ButtonType { normal, login }

sealed class CostumButton {}

class NormalButton extends CostumButton {
  final void Function()? onPressed;
  final String text;
  NormalButton({this.onPressed, required this.text});
}

class LoginButton extends CostumButton {
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  LoginButton({this.onPressed, required this.text, required this.icon});
}

class Button {
  static Widget make(
    BuildContext c, {
    required ButtonType tip,
    required CostumButton ayar,
  }) {
    switch (tip) {
      case ButtonType.normal:
        NormalButton self = ayar as NormalButton;
        return CostumBtn(
          text: self.text,
          onPressed: self.onPressed,
          bgColor: c.red,
          genislik: 200,
          yukseklik: 50,
          textColor: c.white,
          textSize: 35,
          textWeight: c.fwkalin,
        );
      case ButtonType.login:
        LoginButton self = ayar as LoginButton;
        return GestureDetector(
          onTap: self.onPressed,
          child: SizedBox(
            height: 60,
            width: 300,
            child: Card(
              color: c.black,
              child: ListTile(
                leading: Icon(self.icon, color: c.white),
                title: Text(self.text),
              ),
            ),
          ),
        );
    }
  }
}
