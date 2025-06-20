// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/appbar_config.dart';
import 'package:flutter_application_1/core/widget/costum_button.dart';
import 'package:flutter_application_1/core/widget/costum_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.build(
        type: AppBarType.withAction,
        config: WithActionAppBarConfig(
          title: "Deneme",
          center: true,
          action: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("data-1")),
                  PopupMenuItem(child: Text("data-2")),
                ];
              },
            ),
          ],
        ),
      ),

      /* appBar: AppBarFactory.build2(
        config: WithActionAppBarConfig(
          title: "Deneme",
          action: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("data-1")),
                  PopupMenuItem(child: Text("data-2")),
                ];
              },
            ),
          ],
        ),
      ), */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFactory.build(
              TitleText(text: "text", size: 34),
              TextType.title,
            ),
            TextFactory.build(BodyText(text: "body"), TextType.body),
            TextFactory.build(
              SubtitleText(text: "subtitle"),
              TextType.subtitle,
            ),
            Button.make(
              context,
              tip: ButtonType.login,
              ayar: LoginButton(
                text: "emin",
                icon: Icons.add,
                onPressed: () => print("object"),
              ),
            ),
            Button.make(
              context,
              tip: ButtonType.normal,
              ayar: NormalButton(text: "text"),
            ),
          ],
        ),
      ),
    );
  }
}
