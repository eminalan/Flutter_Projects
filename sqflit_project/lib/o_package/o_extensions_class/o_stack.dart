import 'package:flutter/material.dart';

class OStackH {
  final List<Widget> _child;

  OStackH(this._child);
  VerticalDirection _verticalDirection = VerticalDirection.down;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  OStackH get mainAxisSizeMax => (_mainAxisSize = MainAxisSize.max, this).$2;
  OStackH get mainAxisSizeMin => (_mainAxisSize = MainAxisSize.min, this).$2;
  OStackH get down => (_verticalDirection = VerticalDirection.down, this).$2;
  OStackH get up => (_verticalDirection = VerticalDirection.up, this).$2;

  OStackH get crossAxisCenter =>
      (_crossAxisAlignment = CrossAxisAlignment.center, this).$2;
  OStackH get crossAxisbaseline =>
      (_crossAxisAlignment = CrossAxisAlignment.baseline, this).$2;
  OStackH get crossAxisEnd =>
      (_crossAxisAlignment = CrossAxisAlignment.end, this).$2;

  OStackH get crossAxisStart =>
      (_crossAxisAlignment = CrossAxisAlignment.start, this).$2;
  OStackH get crossAxisStretch =>
      (_crossAxisAlignment = CrossAxisAlignment.stretch, this).$2;

  OStackH get mainAxisCenter =>
      (_mainAxisAlignment = MainAxisAlignment.center, this).$2;
  OStackH get mainAxisEnd =>
      (_mainAxisAlignment = MainAxisAlignment.end, this).$2;
  OStackH get mainAxisSpaceAround =>
      (_mainAxisAlignment = MainAxisAlignment.spaceAround, this).$2;
  OStackH get mainAxisSpaceBetween =>
      (_mainAxisAlignment = MainAxisAlignment.spaceBetween, this).$2;
  OStackH get mainAxisSpaceEvenly =>
      (_mainAxisAlignment = MainAxisAlignment.spaceEvenly, this).$2;
  OStackH get mainAxisStart =>
      (_mainAxisAlignment = MainAxisAlignment.start, this).$2;

  Widget make({Key? key}) {
    return Row(
      key: key,
      verticalDirection: _verticalDirection,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisAlignment: _mainAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: _child,
    );
  }
}

class OStackV {
  final List<Widget> _child;

  OStackV(this._child);
  VerticalDirection _verticalDirection = VerticalDirection.down;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  OStackV get mainAxisSizeMax => (_mainAxisSize = MainAxisSize.max, this).$2;
  OStackV get mainAxisSizeMin => (_mainAxisSize = MainAxisSize.min, this).$2;
  OStackV get down => (_verticalDirection = VerticalDirection.down, this).$2;
  OStackV get up => (_verticalDirection = VerticalDirection.up, this).$2;

  OStackV get crossAxisCenter =>
      (_crossAxisAlignment = CrossAxisAlignment.center, this).$2;
  OStackV get crossAxisbaseline =>
      (_crossAxisAlignment = CrossAxisAlignment.baseline, this).$2;
  OStackV get crossAxisEnd =>
      (_crossAxisAlignment = CrossAxisAlignment.end, this).$2;

  OStackV get crossAxisStart =>
      (_crossAxisAlignment = CrossAxisAlignment.start, this).$2;
  OStackV get crossAxisStretch =>
      (_crossAxisAlignment = CrossAxisAlignment.stretch, this).$2;

  OStackV get mainAxisCenter =>
      (_mainAxisAlignment = MainAxisAlignment.center, this).$2;
  OStackV get mainAxisEnd =>
      (_mainAxisAlignment = MainAxisAlignment.end, this).$2;
  OStackV get mainAxisSpaceAround =>
      (_mainAxisAlignment = MainAxisAlignment.spaceAround, this).$2;
  OStackV get mainAxisSpaceBetween =>
      (_mainAxisAlignment = MainAxisAlignment.spaceBetween, this).$2;
  OStackV get mainAxisSpaceEvenly =>
      (_mainAxisAlignment = MainAxisAlignment.spaceEvenly, this).$2;
  OStackV get mainAxisStart =>
      (_mainAxisAlignment = MainAxisAlignment.start, this).$2;

  Widget make({Key? key}) {
    return Column(
      key: key,
      verticalDirection: _verticalDirection,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisAlignment: _mainAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: _child,
    );
  }
}

/* class OStackV extends OStackH {
  OStackV(super.child);

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
} */
