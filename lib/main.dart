import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:quoteup/services/auth_service.dart';
import 'firebase_options.dart';
import 'pages/home/home_view.dart';
import 'pages/second/second_view.dart';
import 'pages/login/login_view.dart';
import 'pages/forgot_password/forgot_password_view.dart';
import 'pages/register/register_view.dart';
import 'shared/controllers/loader_controller.dart';
import 'shared/providers/loader_provider.dart';
import 'shared/widgets/linear_loader.dart';
import 'shared/widgets/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loaderController = LoaderController();
    final authService = AuthService();
    final authUser = authService.currentUser;

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
        initialRoute: authUser != null ? '/' : '/login',
        routes: {
          '/login': (context) => const LoginView(),
          '/register': (context) => const RegisterView(),
          '/forgot-password': (context) => const ForgotPasswordView(),
          '/': (context) => AuthWrapper(child: HomeView()),
          '/segunda': (context) => AuthWrapper(child: SecondView()),
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
