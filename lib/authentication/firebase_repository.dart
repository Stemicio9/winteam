





import 'package:firebase_auth/firebase_auth.dart';
import 'package:winteam/main.dart';

Future createUser(String email, String password) async{
  try{
  var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  return result;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


Future<UserCredential?> signIn(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    await fetchBaseUrl();
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}


Future<bool> askResetPassword(String email) async {
   await FirebaseAuth.instance
      .sendPasswordResetEmail(email: email);
  return true;
}


Future<bool> updatePassword(String newPassword) async {
  await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
  return true;
}

Future<bool> updateEmail(String newEmail) async {
  await FirebaseAuth.instance.currentUser?.updateEmail(newEmail);
  return true;
}