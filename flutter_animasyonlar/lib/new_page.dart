

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController? controler;
  SequenceAnimation? sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controler = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0.0, end: 1.0),
            from: Duration.zero,
            to: Duration(milliseconds: 200),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(milliseconds: 250),
            to: Duration(milliseconds: 500),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50.0, end: 150.0),
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 750),
            tag: "height")
        .addAnimatable(
            animatable: EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 16),
                end: EdgeInsets.only(bottom: 75)),
            from: Duration(milliseconds: 750),
            to: Duration(milliseconds: 1000),
            tag: "padding",
            curve: Curves.easeIn)
        .addAnimatable(
            animatable: BorderRadiusTween(
                begin: BorderRadius.circular(4.0),
                end: BorderRadius.circular(75.0)),
            from: Duration(milliseconds: 750),
            to: Duration(milliseconds: 1000),
            tag: "borderRadius",
            curve: Curves.ease)
        .addAnimatable(
            animatable: ColorTween(begin: Colors.indigo, end: Colors.orange),
            from: Duration(milliseconds: 1000),
            to: Duration(milliseconds: 1500),
            tag: "color",
            curve: Curves.ease)
        .animate(controler!);
    controler!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('next page'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controler!,
          builder: (context, child) {
            return Container(
              padding: sequenceAnimation!["padding"].value,
              child: Opacity(
                opacity: sequenceAnimation!["opacity"].value,
                child: Container(
                  decoration: BoxDecoration(
                      color: sequenceAnimation!["color"].value,
                      borderRadius: sequenceAnimation!["borderRadius"].value),
                  width: sequenceAnimation!["width"].value,
                  height: sequenceAnimation!["height"].value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
