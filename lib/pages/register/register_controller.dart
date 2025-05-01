import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../shared/providers/loader_provider.dart';
import '../../services/auth_service.dart';
import '../../services/user_service.dart';

class RegisterController {
  final _authService = AuthService();
  final _userService = UserService();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    if (!context.mounted) return;

    final loader = LoaderProvider.of(context);
    loader.showLoader();

    try {
      final userCredential = await _authService.createUserWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text,
      );

      await _userService.createUser(
        uid: userCredential.user!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
      );

      if (!context.mounted) return;
      loader.hideLoader();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      if (!context.mounted) return;
      loader.hideLoader();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_getErrorMessage(e)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _getErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'weak-password':
          return 'A senha é muito fraca';
        case 'email-already-in-use':
          return 'Este e-mail já está em uso';
        case 'invalid-email':
          return 'E-mail inválido';
        case 'operation-not-allowed':
          return 'Operação não permitida';
        default:
          return 'Erro ao cadastrar: ${error.message}';
      }
    }
    return 'Erro ao cadastrar';
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
