import 'package:flutter/material.dart';
import 'second_controller.dart';

class SecondView extends StatelessWidget {
  final SecondController _controller = SecondController();

  SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Tela')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você está na Segunda Tela!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _controller.navigateBack(context),
              child: const Text('Voltar para Tela Inicial'),
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
