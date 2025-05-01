import 'package:flutter/material.dart';

class LinearLoader extends StatefulWidget {
  const LinearLoader({super.key});

  @override
  State<LinearLoader> createState() => _LinearLoaderState();
}

class _LinearLoaderState extends State<LinearLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
          backgroundColor: colorScheme.primaryContainer,
          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          minHeight: 4,
        );
      },
    );
  }
}
