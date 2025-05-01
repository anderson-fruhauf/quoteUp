import 'package:flutter/material.dart';
import '../../shared/providers/loader_provider.dart';

class HomeController {
  void navigateToSecondScreen(BuildContext context) {
    Navigator.pushNamed(context, '/segunda');
  }

  Future<void> testLoader(BuildContext context) async {
    final loader = LoaderProvider.of(context);
    loader.showLoader();
    await Future.delayed(const Duration(seconds: 2));
    loader.hideLoader();
  }
}
