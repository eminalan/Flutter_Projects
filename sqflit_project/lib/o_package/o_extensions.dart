// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'o_extensions_class/o_box.dart';
import 'o_extensions_class/o_dropdown_bottom.dart';
import 'o_extensions_class/o_floating_actions_button.dart';

import 'o_decorations/o_shape.dart';
import 'o_extensions_class/o_elevated_button.dart';
import 'o_extensions_class/o_scroll.dart';
import 'o_extensions_class/o_stack.dart';
import 'o_extensions_class/o_text.dart';

extension MyMediaQueryExtensions on BuildContext {
  /// Ekranın genişliğini döndürür.
  double get screenWidth => MediaQuery.of(this).size.width;
  Widget myDivider({
    double? height,
    Color? color,
    double? left,
    double? right,
  }) {
    return "".oBox
        .color(color ?? Colors.grey.shade800)
        .size(width: MediaQuery.of(this).size.width, height: height ?? .7)
        .make()
        .pOnly(left: left ?? 8, right: right ?? 8);
  }

  /// Ekranın yüksekliğini döndürür.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Cihazın yönünü döndürür.
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Ekranın kısa kenarını (width veya height) döndürür.
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  /// Ekranın uzun kenarını (width veya height) döndürür.
  double get longestSide => MediaQuery.of(this).size.longestSide;

  /// Cihazın dikey modda olup olmadığını kontrol eder.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Cihazın yatay modda olup olmadığını kontrol eder.
  bool get isLandscape => orientation == Orientation.landscape;

  OShape get oShape => OShape();
}

extension MyStringExt on String {
  int get toInt => int.parse(this);
  double get toDouble => double.parse(this);

  /// Bir``` DateTime nesnesini ```   Türkçe formatlı bir tarih string'ine dönüştürür.
  ///
  /// [pattern]: Tarih string'ini bölmek için kullanılacak ayraç. Varsayılan değer `"-"`.
  /// [saatGoster]: Saati de göstermek isteniyorsa `true` olmalıdır. Varsayılan değer `false`.
  /// [tarihiFullGoster]: Tarih 4 basamak göstermek için `true` olmalıdır. Varsayılan değer `false`.
  ///
  /// Örnek Kullanım:
  /// ```dart
  /// DateTime.now().toString().toTurkishDate(); // Çıktı: "Gün Ay Yıl - Saat:Dakika"
  /// "15-08-2023 14:30".toTurkishDate(saatGoster: true); // Çıktı: "15 Ağustos 2023 14:30"
  /// "15-08-2023".toTurkishDate(); // Çıktı: "15 Ağustos 2023"
  /// ```
  String toTurkishDate({
    bool saatGoster = false,
    bool tarihiFullGoster = false,
    String pattern = "-",
  }) => _toDateTime(
    split(" ")[0],
    pattern,
    split(" ")[1],
    saatGoster,
    tarihiFullGoster,
  );
  OElevatedButton get oElevatedButton => OElevatedButton(this);
  OText get oText => OText(this);
  OFloatinActionButton get oFloatingActBtn => OFloatinActionButton(Text(this));
  OBox get oBox => OBox(Text(this));
  bool get isEmail {
    // Eğer email null ise veya boş bir string ise geçersiz kabul et
    if (isEmpty) return false;

    // E-posta formatını kontrol etmek için regex deseni
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    // Regex ile eşleşme kontrolü yap
    return emailRegex.hasMatch(this);
  }
}

extension MyNumExt on num {
  OText get oText => OText(toString());
  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());
  OFloatinActionButton get oFloatingActBtn =>
      OFloatinActionButton(Text(toString()));
}

extension MyWidgetExtesions on Widget {
  OBox get oBox => OBox(this);
  OScrollV get oScrollV => OScrollV(this);
  OScrollH get oScrollH => OScrollH(this);

  Padding pAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
  Padding pOnly({double? top, double? bottom, double? right, double? left}) =>
      Padding(
        padding: EdgeInsets.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          right: right ?? 0,
          left: left ?? 0,
        ),
        child: this,
      );

  OFloatinActionButton get oFloatinActionButton => OFloatinActionButton(this);
  Expanded oExpand({int flex = 1, Key? key}) =>
      Expanded(key: key, flex: flex, child: this);
  Widget oCenter({Key? key, double? widthFactor, double? heightFactor}) =>
      Center(
        key: key,
        widthFactor: heightFactor,
        heightFactor: heightFactor,
        child: this,
      );
}

extension MyListExtensions on List {
  ODropDownBottom get oDropDownBottom => ODropDownBottom(this);
}

extension MyListWidgetExtesions on List<Widget> {
  OStackH get oRow => OStackH(this);
  OStackV get oColumn => OStackV(this);
}

enum ShapeType {
  roundedRectangle,
  circle,
  beveledRectangle,
  stadium,
  continuousRectangle,
}

String _toDateTime(
  String time,
  String pattern,
  String saat,
  bool saatGoster,
  bool tarihiFullGoster,
) {
  saat = saat.substring(0, 5);
  List<String> t = time.split(pattern);
  String y = t[0];
  String a = t[1];
  String g = t[2];
  return "$g ${_intToMonth(a.toInt)} ${tarihiFullGoster ? y : y.substring(2, 4)} ${saatGoster ? "- $saat" : ""}";
}

String _intToMonth(int ay) {
  switch (ay) {
    case 1:
      return "Ocak";
    case 2:
      return "Şubat";
    case 3:
      return "Mart";
    case 4:
      return "Nisan";
    case 5:
      return "Mayıs";
    case 6:
      return "Haziran";
    case 7:
      return "Temmuz";
    case 8:
      return "Ağustos";
    case 9:
      return "Eylül";
    case 10:
      return "Ekim";
    case 11:
      return "Kasım";
    case 12:
      return "Aralık";

    default:
      return "";
  }
}

abstract class ODecorationProperties {
  static OShape get oShape => OShape();
}
