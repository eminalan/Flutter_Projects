// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

enum TextType { title, body, subtitle }

sealed class TextConfig {}

class TitleText extends TextConfig {
  final String text;
  final double size;
  TitleText({required this.text, required this.size});
}

class BodyText extends TextConfig {
  final String text;
  BodyText({required this.text});
}

class SubtitleText extends TextConfig {
  final String text;
  SubtitleText({required this.text});
}

class TextFactory {
  static Text build(TextConfig config, TextType type) {
    switch (type) {
      case TextType.title:
        TitleText self = config as TitleText;
        return Text(self.text, style: TextStyle(fontSize: self.size));

      case TextType.body:
        BodyText self = config as BodyText;
        return Text(self.text, style: TextStyle(fontSize: 20));

      case TextType.subtitle:
        SubtitleText self = config as SubtitleText;
        return Text(self.text, style: TextStyle(fontSize: 10));
    }
  }
}
