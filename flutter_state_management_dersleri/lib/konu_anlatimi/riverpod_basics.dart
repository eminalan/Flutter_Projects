import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_providers.dart';

class RiverpodBasics extends StatelessWidget {
  const RiverpodBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Consumer(
            builder: (context, ref, child) => Text(ref.watch(titleProvider)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyText(),
              MyCounterText(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton());
  }
}

class MyText extends ConsumerWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      Consumer(builder: (context, ref, child) => Text(ref.watch(TextProvider)));
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref.read(sayacStateProvider.notifier).state++,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sayac = ref.watch(sayacStateProvider);
    return Text(
      '$sayac',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
