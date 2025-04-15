import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register
  Future<String?> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser newUser = AppUser(
        uid: result.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        role: role,
        registeredAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(newUser.uid)
          .set(newUser.toMap());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Login
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Logout
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
