import 'package:flutter/material.dart';

class MyInhertedCustomWidget extends InheritedWidget {
  final String myValue;

  const MyInhertedCustomWidget({
    super.key,
    required this.myValue,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant MyInhertedCustomWidget oldWidget) {
    return oldWidget.myValue != myValue;
  }

  static MyInhertedCustomWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyInhertedCustomWidget>()!;
  }
}

extension MyCustomWidgetExtension on BuildContext {
  MyInhertedCustomWidget get myCustomWidget => MyInhertedCustomWidget.of(this);
}
