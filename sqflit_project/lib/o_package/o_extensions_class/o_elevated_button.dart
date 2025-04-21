import 'package:flutter/material.dart';

class OElevatedButton {
  String _data;
  OElevatedButton(this._data);

  Color? _bgColor;
  Color? _textColor;
  VoidCallback? _onPressed;
  VoidCallback? _onLongPress;
  Function(bool)? _onHover;

  double? _left;
  double? _right;
  double? _top;
  double? _bottom;
  double? _leftMargin;
  double? _rightMargin;
  double? _topMargin;
  double? _bottomMargin;
  double? _elevation;

  double? _borderWidth;
  double? _strokeAlign;
  Color? _borderColor;
  double? _textSize;
  double? _width;
  double? _height;
  bool? _bold;
  TextDecoration? _textDecoration;
  bool _combine = false;
  List<TextDecoration>? _decorationsList;

  Widget make() {
    return SizedBox(
      width: _width,
      height: _height,
      child: Padding(
        padding: EdgeInsets.only(
          left: _leftMargin ?? 0,
          right: _rightMargin ?? 0,
          top: _topMargin ?? 0,
          bottom: _bottomMargin ?? 0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: _elevation,
            padding: EdgeInsets.only(
              left: _left ?? 24,
              right: _right ?? 24,
              top: _top ?? 0,
              bottom: _bottom ?? 0,
            ),
            backgroundColor: _bgColor,
            side: BorderSide(
              color: _borderColor ?? Colors.transparent,
              width: _borderWidth ?? 1,
              strokeAlign: _strokeAlign ?? 0,
            ),
            textStyle: TextStyle(
              color: _textColor,
              fontSize: _textSize,
              fontWeight: _bold == true ? FontWeight.bold : FontWeight.normal,
              decoration:
                  _combine
                      ? TextDecoration.combine(_decorationsList!)
                      : _textDecoration,
            ),
          ),
          onPressed: _onPressed ?? () {},
          onLongPress: _onLongPress ?? () {},
          onHover: _onHover,
          child: Text(
            _data,
            style: TextStyle(color: _textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }

  OElevatedButton combineTextDecoration(List<TextDecoration> decorationsList) {
    _combine = true;
    _decorationsList = decorationsList;
    return this;
  }

  OElevatedButton get overline {
    _textDecoration = TextDecoration.overline;
    return this;
  }

  OElevatedButton get underline {
    _textDecoration = TextDecoration.underline;
    return this;
  }

  OElevatedButton get lineThrough {
    _textDecoration = TextDecoration.lineThrough;
    return this;
  }

  OElevatedButton get bold {
    _bold = true;
    return this;
  }

  OElevatedButton size(double size) {
    _textSize = size;
    return this;
  }

  OElevatedButton width(double size) {
    _width = size;
    return this;
  }

  OElevatedButton height(double size) {
    _height = size;
    return this;
  }

  OElevatedButton elevation(double elevation) {
    _elevation = elevation;
    return this;
  }

  OElevatedButton border({
    Color? color = Colors.black,
    double? width,
    double? strokeAlign,
  }) {
    _borderColor = color;
    _borderWidth = width;
    _strokeAlign = strokeAlign;
    return this;
  }

  OElevatedButton mOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    _leftMargin = left;
    _rightMargin = right;
    _topMargin = top;
    _bottomMargin = bottom;
    return this;
  }

  OElevatedButton pOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    _left = left;
    _right = right;
    _top = top;
    _bottom = bottom;
    return this;
  }

  OElevatedButton p(double value) {
    _left = value;
    _right = value;
    _top = value;
    _bottom = value;
    return this;
  }

  OElevatedButton pX(double value) {
    _left = value;
    _right = value;
    _top = 10;
    _bottom = 10;
    return this;
  }

  OElevatedButton pY(double value) {
    _left = 10;
    _right = 10;
    _top = value;
    _bottom = value;
    return this;
  }

  OElevatedButton onPressed(void Function() onPressed) {
    _onPressed = onPressed;
    return this;
  }

  OElevatedButton onLongPress(void Function() onLongPress) {
    _onLongPress = onLongPress;
    return this;
  }

  OElevatedButton onHover(void Function(bool value) onHover) {
    _onHover = onHover;
    return this;
  }

  OElevatedButton backgroundColor(Color Colors) {
    _bgColor = Colors;
    return this;
  }

  OElevatedButton color(Color Colors) {
    _textColor = Colors;
    return this;
  }

  OElevatedButton get textColorRed {
    _textColor = Colors.red;
    return this;
  }
}
