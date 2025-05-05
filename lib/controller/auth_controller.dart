import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login function
  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Optional: You can navigate or show a success message here
    } on FirebaseAuthException catch (e) {
      errorMessage.value = _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  // Register function
  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optional: Navigate to login/home screen or show confirmation
    } on FirebaseAuthException catch (e) {
      errorMessage.value = _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // Optional: Central error handler
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'That email is already in use.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      case 'invalid-email':
        return 'Email address is not valid.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
