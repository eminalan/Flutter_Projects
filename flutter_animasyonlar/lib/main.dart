// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animasyonlar/animasyon_widgetleri.dart';
import 'package:flutter_animasyonlar/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 20,
      upperBound: 40,
    );
    controller!.addListener(() {
      setState(() {
        debugPrint(controller!.value.toString());
      });
    });
    controller!.forward();
    controller!.addListener(
      () {
        debugPrint(controller!.value.toString());
      },
    );
    animation = Tween(begin: 20.0, end: 40.0).animate(controller!);
    controller!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse().orCancel;
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward().orCancel;
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(controller!.value / 100.0),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  fontSize: controller!.value + 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: "emin",
              child: FlutterLogo(size: 100 ,style: FlutterLogoStyle.stacked,),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(),
                    ));
              },
              child: Text("new page"),
            ),  ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimasyonWidgetleri(),
                    ));
              },
              child: Text("Animasyonlar "),
            ),
          ],
        ),
      ),
    );
  }
}
