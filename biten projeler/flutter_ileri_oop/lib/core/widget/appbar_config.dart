import 'package:flutter/material.dart';

///AppBarType Açıklama
enum AppBarType { simple, withAction }

sealed class AppBarConfig {}

class SimpleAppBarConfig extends AppBarConfig {
  final String title;
  final bool? center;
  SimpleAppBarConfig({required this.title, this.center});
}

class WithActionAppBarConfig extends AppBarConfig {
  final String title;
  final bool? center;
  final List<Widget> action;
  WithActionAppBarConfig({
    required this.title,
    this.center,
    required this.action,
  });
}

///Uses:
///
///```dart
///AppBarType.withAction,
///config: WithActionAppBarConfig(
///title: "Deneme",
///center: true,
///action: [
///PopupMenuButton(
///   itemBuilder: (context) {
///    return [
///      PopupMenuItem(child: Text("data-1")),
///      PopupMenuItem(child: Text("data-2")),
///   ];
///   },
///  ),
/// ],
///  ),
///````
///# Başlık
///## Alt başlık

class AppBarFactory {
  ///Config açıklama
  ///- Açıklama 1
  ///- Açıklama 2
  ///```dart
  ///print("Deneme")
  ///````

  static PreferredSizeWidget build({
    required AppBarType type,
    required AppBarConfig config,
  }) {
    switch (type) {
      case AppBarType.simple:
        final c = config as SimpleAppBarConfig;
        return AppBar(title: Text(c.title), centerTitle: c.center);

      case AppBarType.withAction:
        final c = config as WithActionAppBarConfig;
        return AppBar(
          title: Text(c.title),
          centerTitle: c.center,
          actions: c.action,
        );
    }
  }

  /* static PreferredSizeWidget build2({required AppBarConfig config}) {
    switch (config) {
      case SimpleAppBarConfig(:final title, :final center):
        return AppBar(title: Text(title), centerTitle: center);

      case WithActionAppBarConfig(:final title, :final action, :final center):
        return AppBar(title: Text(title), centerTitle: center, actions: action);
    }
  } */
}
 