import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static Future<UserCredential> firebaseSignUp({
    required String email,
    required String password,
  }) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }
}
