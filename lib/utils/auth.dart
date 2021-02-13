import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUser(email, password, name) async {
    try {
      User user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      user.updateProfile(displayName: name);
      user.reload();

      return user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> signIn(email, password) async {
    try {
      User user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      return user.uid != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<String> getUserUid() async {
    User user = _firebaseAuth.currentUser;

    return user != null ? user.uid : null;
  }

  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;

    return user;
  }

  Future<String> getUserName() async {
    User user = _firebaseAuth.currentUser;

    return user.displayName;
  }

  Future resetPassword(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future signOut() async {
    return _firebaseAuth.signOut();
  }
}
