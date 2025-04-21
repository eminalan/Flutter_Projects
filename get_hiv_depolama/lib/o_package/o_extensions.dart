// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

extension MyMediaQueryExtensions on BuildContext {
  /// Ekranın genişliğini döndürür.
  double get screenWidth => MediaQuery.of(this).size.width;

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
}

extension MyStringExt on String {
  _MyText get oText => _MyText(this);
  _MyFloatinActionButton get oFloatinActionButton =>
      _MyFloatinActionButton(Text(this));

  bool get isEmail {
    // Eğer email null ise veya boş bir string ise geçersiz kabul et
    if (isEmpty) return false;

    // E-posta formatını kontrol etmek için regex deseni
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    // Regex ile eşleşme kontrolü yap
    return emailRegex.hasMatch(this);
  }
}

extension MyNumExt on num {
  _MyText get oText => _MyText(toString());
  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());
  _MyFloatinActionButton get oFloatinActionButton =>
      _MyFloatinActionButton(Text(toString()));
}

extension MyWidgetExtesions on Widget {
  _MyContainer get oContainer => _MyContainer(this);
  _MyScroll get oScroll => _MyScroll(this);

  _MyFloatinActionButton get oFloatinActionButton =>
      _MyFloatinActionButton(this);
  Expanded oExpanded({int flex = 1, Key? key}) =>
      Expanded(key: key, flex: flex, child: this);
  Widget oCenter({
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Center(
          key: key,
          widthFactor: heightFactor,
          heightFactor: heightFactor,
          child: this);
}

extension MyListWidgetExtesions on List<Widget> {
  _MyRow get oRow => _MyRow(this);
  _MyColumn get oColumn => _MyColumn(this);
}

/*class MyFloatinActionButton {
  final Widget _child;

  bool _autofocus = false;
  Color? _backgroundColor;
  String? _tooltip;

  double? _elevation;

  MyFloatinActionButton get autofocus => (_autofocus = true, this).$2;
  MyFloatinActionButton backgroundColor(Color color) =>
      (_backgroundColor = color, this).$2;
  MyFloatinActionButton tooltip(String tooltip) =>
      (_tooltip = tooltip, this).$2;
  MyFloatinActionButton elevation(double elevation) =>
      (_elevation = elevation, this).$2;

  MyFloatinActionButton(this._child);
  FloatingActionButton make({Key? key, required void Function()? onPressed}) {
    return FloatingActionButton(
      key: key,
      onPressed: onPressed,
      autofocus: _autofocus,
      backgroundColor: _backgroundColor,
      tooltip: _tooltip,
      elevation: _elevation,
      child: _child,
    );
  }
}*/

class _MyFloatinActionButton {
  final Widget _child;

  bool _autofocus = false;
  Color? _backgroundColor;
  String? _tooltip;

  double? _elevation;

  _MyFloatinActionButton get autofocus => (_autofocus = true, this).$2;
  _MyFloatinActionButton backgroundColor(Color color) =>
      (_backgroundColor = color, this).$2;
  _MyFloatinActionButton tooltip(String tooltip) =>
      (_tooltip = tooltip, this).$2;
  _MyFloatinActionButton elevation(double elevation) =>
      (_elevation = elevation, this).$2;

  _MyFloatinActionButton(this._child);
  FloatingActionButton make({Key? key, required void Function()? onPressed}) {
    return FloatingActionButton(
      key: key,
      onPressed: onPressed,
      autofocus: _autofocus,
      backgroundColor: _backgroundColor,
      tooltip: _tooltip,
      elevation: _elevation,
      child: _child,
    );
  }
}

class _MyScroll {
  final Widget _child;
  _MyScroll(this._child);
  Axis _scrollDirection = Axis.vertical;
  ScrollPhysics? _physics;

  _MyScroll get horizantal => (_scrollDirection = Axis.horizontal, this).$2;
  _MyScroll get vertical => (_scrollDirection = Axis.horizontal, this).$2;
  _MyScroll physics(ScrollPhysics? physics) => (_physics = physics, this).$2;

  Widget make({ScrollController? controller}) {
    return SingleChildScrollView(
      scrollDirection: _scrollDirection,
      physics: _physics,
      controller: controller,
      child: _child,
    );
  }
}

class _MyContainer {
  Widget child;
  _MyContainer(this.child);

  AlignmentGeometry? _setAlignment;

  _MyContainer get center => (_setAlignment = Alignment.center, this).$2;

  _MyContainer get centerLeft {
    _setAlignment = Alignment.centerLeft;
    return this;
  }

  _MyContainer get centerRight {
    _setAlignment = Alignment.centerRight;
    return this;
  }

  _MyContainer get topCenter {
    _setAlignment = Alignment.topCenter;
    return this;
  }

  _MyContainer get topLeft {
    _setAlignment = Alignment.topLeft;
    return this;
  }

  _MyContainer get topRight {
    _setAlignment = Alignment.topRight;
    return this;
  }

  _MyContainer get bottomCenter {
    _setAlignment = Alignment.bottomCenter;
    return this;
  }

  _MyContainer get bottomLeft {
    _setAlignment = Alignment.bottomLeft;
    return this;
  }

  _MyContainer get bottomRight {
    _setAlignment = Alignment.bottomRight;
    return this;
  }

  double? _height;
  double? _width;

  _MyContainer height(double value) => (_height = value, this).$2;
  _MyContainer width(double value) => (_width = value, this).$2;
  _MyContainer size(double height, double width) =>
      (_height = height, _width = width, this).$3;

  BoxConstraints? _constraints;

  _MyContainer constraints(BoxConstraints value) {
    _constraints = value;
    return this;
  }

  Clip _clipBehavior = Clip.none;
  _MyContainer clipBehavior(Clip value) {
    _clipBehavior = value;
    return this;
  }

  BoxBorder? _border;
  _MyContainer border({
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
    double width = 1,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) {
    _border = Border.all(
      color: color,
      style: style,
      width: width,
      strokeAlign: strokeAlign,
    );
    return this;
  }

  BorderRadiusGeometry? _selectborderRadius;

  _MyContainer get circle {
    _selectborderRadius = BorderRadius.circular(360);
    return this;
  }

  _MyContainer radiusAll(double value) {
    _selectborderRadius = BorderRadius.all(Radius.circular(value));
    return this;
  }

  _MyContainer radiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomRight = 0,
    double bottomLeft = 0,
  }) {
    _selectborderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
    );
    return this;
  }

  BlendMode? _backgroundBlendMode;

  _MyContainer backgroundBlendMode(BlendMode backgroundBlendMode) {
    _backgroundBlendMode = backgroundBlendMode;
    return this;
  }

  Color? _bgColor;

  _MyContainer backGroundColor(Color color) {
    _bgColor = color;
    return this;
  }

  List<BoxShadow>? _boxShadow;
  _MyContainer boxShadow(List<BoxShadow>? boxShadow) {
    _boxShadow = boxShadow;
    return this;
  }

  EdgeInsets? _padding;
  EdgeInsets? _margin;
  _MyContainer get p4 => (_padding = const EdgeInsets.all(4), this).$2;
  _MyContainer get p6 => (_padding = const EdgeInsets.all(6), this).$2;
  _MyContainer get p8 => (_padding = const EdgeInsets.all(8), this).$2;
  _MyContainer get p10 => (_padding = const EdgeInsets.all(10), this).$2;
  _MyContainer get p12 => (_padding = const EdgeInsets.all(12), this).$2;
  _MyContainer get p14 => (_padding = const EdgeInsets.all(14), this).$2;
  _MyContainer get p16 => (_padding = const EdgeInsets.all(16), this).$2;
  _MyContainer get p18 => (_padding = const EdgeInsets.all(18), this).$2;
  _MyContainer get p20 => (_padding = const EdgeInsets.all(20), this).$2;
  _MyContainer get p22 => (_padding = const EdgeInsets.all(22), this).$2;
  _MyContainer get p24 => (_padding = const EdgeInsets.all(24), this).$2;

  _MyContainer get m4 => (_margin = const EdgeInsets.all(4), this).$2;
  _MyContainer get m6 => (_margin = const EdgeInsets.all(6), this).$2;
  _MyContainer get m8 => (_margin = const EdgeInsets.all(8), this).$2;
  _MyContainer get m10 => (_margin = const EdgeInsets.all(10), this).$2;
  _MyContainer get m12 => (_margin = const EdgeInsets.all(12), this).$2;
  _MyContainer get m14 => (_margin = const EdgeInsets.all(14), this).$2;
  _MyContainer get m16 => (_margin = const EdgeInsets.all(16), this).$2;
  _MyContainer get m18 => (_margin = const EdgeInsets.all(18), this).$2;
  _MyContainer get m20 => (_margin = const EdgeInsets.all(20), this).$2;
  _MyContainer get m22 => (_margin = const EdgeInsets.all(22), this).$2;
  _MyContainer get m24 => (_margin = const EdgeInsets.all(24), this).$2;

  _MyContainer get px4 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 4), this).$2;
  _MyContainer get px6 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 6), this).$2;
  _MyContainer get px8 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 8), this).$2;
  _MyContainer get px10 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 10), this).$2;
  _MyContainer get px12 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 12), this).$2;
  _MyContainer get px14 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 14), this).$2;
  _MyContainer get px16 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 16), this).$2;
  _MyContainer get px18 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 18), this).$2;
  _MyContainer get px20 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 20), this).$2;
  _MyContainer get px22 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 22), this).$2;
  _MyContainer get px24 =>
      (_padding = const EdgeInsets.symmetric(horizontal: 24), this).$2;

  _MyContainer get py4 =>
      (_padding = const EdgeInsets.symmetric(vertical: 4), this).$2;
  _MyContainer get py6 =>
      (_padding = const EdgeInsets.symmetric(vertical: 6), this).$2;
  _MyContainer get py8 =>
      (_padding = const EdgeInsets.symmetric(vertical: 8), this).$2;
  _MyContainer get py10 =>
      (_padding = const EdgeInsets.symmetric(vertical: 10), this).$2;
  _MyContainer get py12 =>
      (_padding = const EdgeInsets.symmetric(vertical: 12), this).$2;
  _MyContainer get py14 =>
      (_padding = const EdgeInsets.symmetric(vertical: 14), this).$2;
  _MyContainer get py16 =>
      (_padding = const EdgeInsets.symmetric(vertical: 16), this).$2;
  _MyContainer get py18 =>
      (_padding = const EdgeInsets.symmetric(vertical: 18), this).$2;
  _MyContainer get py20 =>
      (_padding = const EdgeInsets.symmetric(vertical: 20), this).$2;
  _MyContainer get py22 =>
      (_padding = const EdgeInsets.symmetric(vertical: 22), this).$2;
  _MyContainer get py24 =>
      (_padding = const EdgeInsets.symmetric(vertical: 24), this).$2;

  _MyContainer get mx4 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 4), this).$2;
  _MyContainer get mx6 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 6), this).$2;
  _MyContainer get mx8 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 8), this).$2;
  _MyContainer get mx10 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 10), this).$2;
  _MyContainer get mx12 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 12), this).$2;
  _MyContainer get mx14 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 14), this).$2;
  _MyContainer get mx16 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 16), this).$2;
  _MyContainer get mx18 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 18), this).$2;
  _MyContainer get mx20 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 20), this).$2;
  _MyContainer get mx22 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 22), this).$2;
  _MyContainer get mx24 =>
      (_margin = const EdgeInsets.symmetric(horizontal: 24), this).$2;

  _MyContainer get my4 =>
      (_margin = const EdgeInsets.symmetric(vertical: 4), this).$2;
  _MyContainer get my6 =>
      (_margin = const EdgeInsets.symmetric(vertical: 6), this).$2;
  _MyContainer get my8 =>
      (_margin = const EdgeInsets.symmetric(vertical: 8), this).$2;
  _MyContainer get my10 =>
      (_margin = const EdgeInsets.symmetric(vertical: 10), this).$2;
  _MyContainer get my12 =>
      (_margin = const EdgeInsets.symmetric(vertical: 12), this).$2;
  _MyContainer get my14 =>
      (_margin = const EdgeInsets.symmetric(vertical: 14), this).$2;
  _MyContainer get my16 =>
      (_margin = const EdgeInsets.symmetric(vertical: 16), this).$2;
  _MyContainer get my18 =>
      (_margin = const EdgeInsets.symmetric(vertical: 18), this).$2;
  _MyContainer get my20 =>
      (_margin = const EdgeInsets.symmetric(vertical: 20), this).$2;
  _MyContainer get my22 =>
      (_margin = const EdgeInsets.symmetric(vertical: 22), this).$2;
  _MyContainer get my24 =>
      (_margin = const EdgeInsets.symmetric(vertical: 24), this).$2;

  _MyContainer p(double value) => (_padding = EdgeInsets.all(value), this).$2;

  _MyContainer m(double value) => (_margin = EdgeInsets.all(value), this).$2;

  _MyContainer pOnly(
          {double left = 0,
          double right = 0,
          double bottom = 0,
          double top = 0}) =>
      (
        _padding = EdgeInsets.only(
          left: left,
          right: right,
          bottom: bottom,
          top: top,
        ),
        this
      )
          .$2;
  _MyContainer mOnly(
          {double left = 0,
          double right = 0,
          double bottom = 0,
          double top = 0}) =>
      (
        _margin = EdgeInsets.only(
          left: left,
          right: right,
          bottom: bottom,
          top: top,
        ),
        this
      )
          .$2;

  Widget make({Key? key}) {
    return Container(
      margin: _margin ?? const EdgeInsets.all(0),
      padding: _padding ?? const EdgeInsets.all(0),
      key: key,
      //color: _color,
      alignment: _setAlignment,
      height: _height,
      width: _width,
      constraints: _constraints,
      clipBehavior: _clipBehavior,
      decoration: BoxDecoration(
        color: _bgColor,
        border: _border,
        borderRadius: _selectborderRadius,
        backgroundBlendMode: _backgroundBlendMode,
        boxShadow: _boxShadow,
      ),
      child: child,
    );
  }
}

class _MyRow {
  final List<Widget> _child;

  _MyRow(this._child);
  VerticalDirection _verticalDirection = VerticalDirection.down;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;

  _MyRow get down => (_verticalDirection = VerticalDirection.down, this).$2;
  _MyRow get up => (_verticalDirection = VerticalDirection.up, this).$2;

  _MyRow get crossAxisCenter =>
      (_crossAxisAlignment = CrossAxisAlignment.center, this).$2;
  _MyRow get crossAxisbaseline =>
      (_crossAxisAlignment = CrossAxisAlignment.baseline, this).$2;
  _MyRow get crossAxisEnd =>
      (_crossAxisAlignment = CrossAxisAlignment.end, this).$2;

  _MyRow get crossAxisStart =>
      (_crossAxisAlignment = CrossAxisAlignment.start, this).$2;
  _MyRow get crossAxisStretch =>
      (_crossAxisAlignment = CrossAxisAlignment.stretch, this).$2;

  _MyRow get mainAxisCenter =>
      (_mainAxisAlignment = MainAxisAlignment.center, this).$2;
  _MyRow get mainAxisEnd =>
      (_mainAxisAlignment = MainAxisAlignment.end, this).$2;
  _MyRow get mainAxisSpaceAround =>
      (_mainAxisAlignment = MainAxisAlignment.spaceAround, this).$2;
  _MyRow get mainAxisSpaceBetween =>
      (_mainAxisAlignment = MainAxisAlignment.spaceBetween, this).$2;
  _MyRow get mainAxisSpaceEvenly =>
      (_mainAxisAlignment = MainAxisAlignment.spaceEvenly, this).$2;
  _MyRow get mainAxisStart =>
      (_mainAxisAlignment = MainAxisAlignment.start, this).$2;

  Widget make({Key? key}) {
    return Row(
      key: key,
      verticalDirection: _verticalDirection,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisAlignment: _mainAxisAlignment,
      children: _child,
    );
  }
}

class _MyColumn extends _MyRow {
  _MyColumn(super.child);

  @override
  Column make({Key? key}) {
    return Column(
      key: key,
      verticalDirection: _verticalDirection,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisAlignment: super._mainAxisAlignment,
      children: _child,
    );
  }
}

class _MyText {
  String _data;
  _MyText(this._data);
  Color? _color;
  FontWeight? _fontWeight;
  double? _fontSize;
  FontStyle? _fontStyle;
  double? _letterSpacing;
  double? _wordSpacing;
  TextBaseline? _textBaseline;
  double? _height;
  TextDecoration? _decoration;
  Color? _decorationColor;
  int _lowerOrUpper = 0;
  // 0=normal
  // 1=toLowerCase
  // 2=toUpperCase
  _MyText get toLower => (_lowerOrUpper = 1, this).$2;
  _MyText get toUpper => (_lowerOrUpper = 2, this).$2;

  //Set Colors
  _MyText color(Color color) => (_color = color, this).$2;
  _MyText get red => (_color = Colors.red, this).$2;
  _MyText get blue => (_color = Colors.blue, this).$2;
  _MyText get amber => (_color = Colors.amber, this).$2;
  _MyText get green => (_color = Colors.green, this).$2;
  _MyText get grey => (_color = Colors.grey, this).$2;
  _MyText get white => (_color = Colors.white, this).$2;
  _MyText get black => (_color = Colors.black, this).$2;
  _MyText get cyan => (_color = Colors.cyan, this).$2;
  _MyText get orange => (_color = Colors.orange, this).$2;
  _MyText get deepOrange => (_color = Colors.deepOrange, this).$2;
  _MyText get purple => (_color = Colors.purple, this).$2;
  _MyText get deepPurple => (_color = Colors.deepPurple, this).$2;
  _MyText get indigo => (_color = Colors.indigo, this).$2;
  //Set Bold
  //_MyText get bold => (_fontWeight = FontWeight.bold, this).$2;
  _MyText bold({int? weight}) =>
      (_fontWeight = _setFontWeight(weight: weight), this).$2;

  //Set TextSize
  _MyText get xl => _setTextSize(20);
  _MyText get xl2 => _setTextSize(24);
  _MyText get xl3 => _setTextSize(28);
  _MyText get xl4 => _setTextSize(32);
  _MyText get xl5 => _setTextSize(36);
  _MyText get xl6 => _setTextSize(40);
  _MyText _setTextSize(double fontSize) => (_fontSize = fontSize, this).$2;
  _MyText size(double size) => _setTextSize(size);

  //Set FontStyle
  _MyText get italic => (_fontStyle = FontStyle.italic, this).$2;
  _MyText letterSpacing(double value) => (_letterSpacing = value, this).$2;
  _MyText wordSpacing(double value) => (_wordSpacing = value, this).$2;

  _MyText get alphabetic => (_textBaseline = TextBaseline.alphabetic, this).$2;
  _MyText get ideographic =>
      (_textBaseline = TextBaseline.ideographic, this).$2;

  _MyText height(double value) => (_height = value, this).$2;

  _MyText udenrline({Color? color}) =>
      (_decoration = TextDecoration.underline, _decorationColor = color, this)
          .$3;
  _MyText overline({Color? color}) =>
      (_decoration = TextDecoration.overline, _decorationColor = color, this)
          .$3;
  //İsim vererek yapılabilir
  _MyText lineThrough({Color? color}) => (
        _decoration = TextDecoration.lineThrough,
        _decorationColor = color,
        returnn: this
      )
          .returnn;

  /* _MyText combine(List<TextDecoration> decorations, {Color? color}) => (
        _decoration = TextDecoration.combine(decorations),
        _decorationColor = color,
        this
      )
          .$3;*/
  _MyText combineTextDecoration({
    bool underline = false,
    bool lineThrough = false,
    bool overLine = false,
    Color? color,
  }) =>
      (
        _decoration = _setCombine(underline, lineThrough, overLine),
        color: _decorationColor = color,
        myText: this
      )
          .myText;

  TextOverflow? _overflow;
  _MyText get overflowClip => (_overflow = TextOverflow.clip, this).$2;
  _MyText get overflowEllipsis => (_overflow = TextOverflow.ellipsis, this).$2;
  _MyText get overflowFade => (_overflow = TextOverflow.fade, this).$2;
  _MyText get overflowVisible => (_overflow = TextOverflow.visible, this).$2;

  TextAlign? _textAlign;
  _MyText get center => (_textAlign = TextAlign.center, this).$2;
  _MyText get end => (_textAlign = TextAlign.end, this).$2;
  _MyText get justify => (_textAlign = TextAlign.justify, this).$2;
  _MyText get left => (_textAlign = TextAlign.left, this).$2;
  _MyText get right => (_textAlign = TextAlign.right, this).$2;
  _MyText get start => (_textAlign = TextAlign.start, this).$2;

  Color? _backgroundColor;
  _MyText backgroundColor({Color? backgroundColor}) =>
      (_backgroundColor = backgroundColor, this).$2;
  _MyText removeFirst({int charLength = 1}) =>
      (_data = _removeFirst(_data, charLength: charLength), this).$2;
  _MyText removeLast({int? charLength = 1}) =>
      (_data = _removeLast(_data, charLength: charLength), this).$2;
  Text make({
    Key? key,
    int? maxLines,
    bool? softWrap,
    StrutStyle? strutStyle,
    String? semanticsLabel,
    Color? selectionColor,
    Locale? locale,
  }) {
    return Text(
      _toLowerOrUpperCase(_data, _lowerOrUpper),
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: _overflow,
      selectionColor: selectionColor,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textAlign: _textAlign,
      style: TextStyle(
        color: _color,
        fontWeight: _fontWeight,
        fontSize: _fontSize,
        fontStyle: _fontStyle,
        letterSpacing: _letterSpacing, // Harfler arası boşluk
        wordSpacing: _wordSpacing, // Kelimeler arası boşluk
        textBaseline: _textBaseline,
        height: _height, // Satır yüksekliği (FontSize ile carpilir)
        decoration: _decoration,
        decorationColor: _decorationColor, // Dekorasyon rengi
        backgroundColor: _backgroundColor,
      ),
    );
  }
}

String _removeFirst(String data, {int? charLength}) {
  // Varsayılan değer: Eğer silinecekHarfSayisi null ise 1 olarak ayarla
  int dataLength = charLength ?? 1;
  // Eğer silinecek harf sayısı, metnin uzunluğundan büyükse boş string döndür
  if (dataLength >= data.length) return '';
  // Belirtilen sayıda harfi baştan kes
  return data.substring(dataLength);
}

String _removeLast(String data, {int? charLength}) {
  // Varsayılan değer: Eğer silinecekHarfSayisi null ise 1 olarak ayarla
  int dataLength = charLength ?? 1;
  // Eğer silinecek harf sayısı, metnin uzunluğundan büyükse boş string döndür
  if (dataLength >= data.length) return '';
  // Belirtilen sayıda harfi sondan kes
  return data.substring(0, data.length - dataLength);
}

String _toLowerOrUpperCase(String data, int value) {
  switch (value) {
    case 1:
      return data.toLowerCase();
    case 2:
      return data.toUpperCase();
    default:
      return data;
  }
}

FontWeight _setFontWeight({int? weight = 0}) {
  switch (weight) {
    case 100:
      return FontWeight.w100;
    case 200:
      return FontWeight.w200;
    case 300:
      return FontWeight.w300;
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.w700;
    default:
      return FontWeight.bold;
  }
}

TextDecoration _setCombine(
  bool underline,
  bool lineThrough,
  bool overLine,
) {
  return TextDecoration.combine([
    if (underline) TextDecoration.underline,
    if (lineThrough) TextDecoration.lineThrough,
    if (overLine) TextDecoration.overline,
  ]);
}
