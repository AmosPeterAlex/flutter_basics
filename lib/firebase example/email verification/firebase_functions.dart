import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctionss {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  ///reg a new user
  Future<String?> regUser({required String email, required String pwd}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> loginUser1(
      {required String email, required String pass}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      // return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
    return null;
  }

  Future<String?> loginUser(
      {required String email, required String pass}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
