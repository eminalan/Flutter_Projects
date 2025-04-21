import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "To Do App",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(color: Colors.red, fontWeight: FontWeight.bold , fontSize: 75),
    );
  }
}
