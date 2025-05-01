import 'package:flutter/material.dart';
import '../controllers/loader_controller.dart';

class LoaderProvider extends InheritedNotifier<LoaderController> {
  const LoaderProvider({
    super.key,
    required super.child,
    required LoaderController controller,
  }) : super(notifier: controller);

  static LoaderController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoaderProvider>()!
        .notifier!;
  }
}
