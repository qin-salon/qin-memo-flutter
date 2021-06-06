import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<String?> getIdToken() async {
    return await FirebaseAuth.instance.currentUser?.getIdToken();
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut(); //Firebaseauth.instance.signOut();
  }
}
