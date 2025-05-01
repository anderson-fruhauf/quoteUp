import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  final Widget child;
  final double? maxWidth;

  const AuthCard({super.key, required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.all(24), child: child),
    );
  }
}
