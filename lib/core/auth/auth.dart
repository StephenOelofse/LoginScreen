import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

Future<void> sendPasswordResetEmail(String email) async {
  return _auth.sendPasswordResetEmail(email: email);
}

Stream<User?>? signInChangeNotifier() {
  return FirebaseAuth.instance.authStateChanges();
}

Future<void> signUserOut() {
  return FirebaseAuth.instance.signOut();
}

void deleteUser() {
  if (_auth.currentUser != null) {
    _auth.currentUser!.delete();
  }
}
