import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    required this.flavorName,
    required this.apiBaseUrl,
    required Widget child,
  }) : super(child: child);

  final String flavorName;
  final String apiBaseUrl;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}