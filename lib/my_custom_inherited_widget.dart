import 'package:flutter/material.dart';

class MyCustomWidget extends InheritedWidget {
  final String myValue;

  const MyCustomWidget({
    super.key,
    required this.myValue,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant MyCustomWidget oldWidget) {
    return oldWidget.myValue != myValue;
  }

  static MyCustomWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyCustomWidget>()!;
  }
}

extension MyCustomWidgetExtension on BuildContext {
  MyCustomWidget get myCustomWidget => MyCustomWidget.of(this);
}
