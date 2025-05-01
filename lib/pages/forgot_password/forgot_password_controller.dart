import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../shared/providers/loader_provider.dart';
import '../../services/auth_service.dart';

class ForgotPasswordController {
  final _authService = AuthService();

  Future<void> sendPasswordResetEmail(
    BuildContext context,
    String email,
  ) async {
    final loader = LoaderProvider.of(context);
    loader.showLoader();

    try {
      await _authService.resetPassword(email);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail de recuperação enviado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pushReplacementNamed('/login');
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
        case 'invalid-email':
          return 'E-mail inválido';
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'too-many-requests':
          return 'Muitas tentativas. Tente novamente mais tarde';
        default:
          return 'Erro ao enviar e-mail de recuperação: ${error.message}';
      }
    }
    return 'Erro ao enviar e-mail de recuperação';
  }
}
