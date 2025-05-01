import 'package:flutter/material.dart';
import '../../shared/providers/loader_provider.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final loader = LoaderProvider.of(context);
    loader.showLoader();

    // Simulando um processo de login
    await Future.delayed(const Duration(seconds: 2));

    loader.hideLoader();
    // Aqui você pode adicionar a lógica real de login
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
