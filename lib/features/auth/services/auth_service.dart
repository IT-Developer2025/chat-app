import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception("An unknown error occurred: $e");
    }
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      throw Exception("An unknown error occurred: $e");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      throw Exception(e);
    }
  }
}
