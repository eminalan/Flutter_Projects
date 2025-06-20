import 'package:flutter/material.dart';

extension Extension on BuildContext {
  //Color
  MaterialColor get sari => Colors.yellow;
  MaterialColor get kirmizi => Colors.red;
  MaterialColor get yesil => Colors.green;
  MaterialColor get mavi => Colors.blue;
  Color get beyaz => Colors.white;
  //sizebox
  SizedBox get normal => SizedBox(height: 16);

  //border
  OutlineInputBorder get border =>
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)));
  //button style
  ButtonStyle get btnYesil =>
      ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green));
  ButtonStyle get btnKirmizi =>
      ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red));
}

extension Cardify on Widget {
  /// Widget'ı kart şeklinde sarmalar
  Widget toCard({
    EdgeInsetsGeometry padding = const EdgeInsets.all(12),
    EdgeInsetsGeometry margin = const EdgeInsets.all(8),
    double borderRadius = 16,
    Color? color,
    Color? shadowColor,
    double elevation = 4,
  }) {
    return Card(
      color: color ?? Colors.teal[400],
      shadowColor: shadowColor ?? Colors.black12,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(padding: padding, child: this),
    );
  }

  Widget metin(
    Color? color,
    double? size,
    FontWeight? fw, {
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.red,
        fontSize: size ?? 16,
        fontWeight: fw ?? FontWeight.bold,
      ),
    );
  }
}
