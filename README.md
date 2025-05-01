# quoteup

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Configuração do Firebase

1. Instale o FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

2. Configure o Firebase para seu projeto:
```bash
flutterfire configure
```

3. Copie o arquivo `firebase_options.dart.example` para `firebase_options.dart` e preencha com suas credenciais do Firebase.

4. Certifique-se de que o arquivo `firebase_options.dart` está no `.gitignore` para não expor suas credenciais.
