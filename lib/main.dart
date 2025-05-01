import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'pages/home/home_view.dart';
import 'pages/second/second_view.dart';
import 'pages/login/login_view.dart';
import 'shared/controllers/loader_controller.dart';
import 'shared/providers/loader_provider.dart';
import 'shared/widgets/linear_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loaderController = LoaderController();

    return LoaderProvider(
      controller: loaderController,
      child: MaterialApp(
        title: 'App Modular',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          // Configurações adicionais do tema escuro
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E1E1E),
            foregroundColor: Colors.white,
          ),
          cardTheme: const CardTheme(color: Color(0xFF1E1E1E)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        // Tema escuro para web
        darkTheme:
            kIsWeb
                ? ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.blue,
                    brightness: Brightness.dark,
                  ),
                  useMaterial3: true,
                )
                : null,
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginView(),
          '/': (context) => HomeView(),
          '/segunda': (context) => SecondView(),
        },
        builder: (context, child) {
          return Column(
            children: [
              if (LoaderProvider.of(context).isLoading) const LinearLoader(),
              Expanded(child: child!),
            ],
          );
        },
      ),
    );
  }
}
