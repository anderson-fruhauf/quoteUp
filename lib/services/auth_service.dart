import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream do usuário atual
  Stream<User?> get userStream => _auth.authStateChanges();

  // Usuário atual
  User? get currentUser => _auth.currentUser;

  Future<bool> isSignedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  // Login com email e senha
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Registro com email e senha
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Resetar senha
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}
