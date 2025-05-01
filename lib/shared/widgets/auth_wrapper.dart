import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final AuthService _authService = AuthService();

  AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authService.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return child;
        }

        Navigator.of(context).pushReplacementNamed('/login');
        return Container();
      },
    );
  }
}
