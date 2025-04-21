import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimasyonWidgetleri extends StatefulWidget {
  const AnimasyonWidgetleri({Key? key}) : super(key: key);

  @override
  _AnimasyonWidgetleriState createState() => _AnimasyonWidgetleriState();
}

class _AnimasyonWidgetleriState extends State<AnimasyonWidgetleri> {
  var _color = Colors.pink;
  double _width = 200;
  double _height = 200;
  bool _ilkCocukAktif = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasyonlar'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                color: _color,
                height: _height,
                width: _width,
              ),
              ElevatedButton(
                onPressed: () {
                  _animatedContainerAnimasyonu();
                },
                child: Text("Animated controler"),
              ),
              AnimatedCrossFade(
                firstChild: Image.network(
                    "https://i.ytimg.com/vi/05vEbwazBs0/hqdefault.jpg"),
                secondChild: Image.network(
                    "https://www.masalcisite.com/wp-content/uploads/bfi_thumb/car-33yvvk97uepc6lc8ru2r62.jpg"),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              ElevatedButton(
                  onPressed: croossAnimasyoun, child: Text("Cross fade"))
            ],
          ),
        ),
      ),
    );
  }

  void croossAnimasyoun() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _animatedContainerAnimasyonu() {
    setState(() {
      _color = _color == Colors.pink ? Colors.blue : Colors.pink;
      _height = _height == 200 ? 300 : 200;
      _width = _width == 200 ? 300 : 200;
    });
  }
}
