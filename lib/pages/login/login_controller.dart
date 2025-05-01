import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../shared/providers/loader_provider.dart';
import '../../services/auth_service.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authService = AuthService();

  Future<void> login(BuildContext context) async {
    final loader = LoaderProvider.of(context);
    loader.showLoader();

    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text,
      );

      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getErrorMessage(e)),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (context.mounted) {
        loader.hideLoader();
      }
    }
  }

  String _getErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'wrong-password':
          return 'Senha incorreta';
        case 'invalid-email':
          return 'E-mail inválido';
        case 'user-disabled':
          return 'Usuário desativado';
        case 'too-many-requests':
          return 'Muitas tentativas. Tente novamente mais tarde';
        default:
          return 'Erro ao fazer login: ${error.message}';
      }
    }
    return 'Erro ao fazer login';
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
