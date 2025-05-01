import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = HomeController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo à Tela Inicial!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _controller.navigateToSecondScreen(context),
              child: const Text('Ir para Segunda Tela'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _controller.testLoader(context),
              child: const Text('Testar Loader'),
            ),
          ],
        ),
      ),
    );
  }
}
