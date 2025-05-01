import 'package:flutter/material.dart';
import 'login_controller.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/auth_card.dart';
import '../../shared/widgets/quoteup_logo.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = LoginController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.primaryContainer, colorScheme.primary],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width > 600 ? 400 : size.width,
                ),
                child: AuthCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const QuoteUpLogo(size: 80),
                        const SizedBox(height: 24),
                        Text(
                          'Bem-vindo',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Faça login para continuar',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 32),
                        CustomTextField(
                          controller: _controller.emailController,
                          label: 'E-mail',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu e-mail';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _controller.passwordController,
                          label: 'Senha',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon:
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                          onSuffixPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'Entrar',
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _controller.login(context);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Navegar para tela de recuperação de senha
                          },
                          child: const Text('Esqueceu sua senha?'),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não tem uma conta?'),
                            TextButton(
                              onPressed: () {
                                // Navegar para tela de cadastro
                              },
                              child: const Text('Cadastre-se'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
