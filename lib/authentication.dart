import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<String?> getIdToken() async {
    return await FirebaseAuth.instance.currentUser?.getIdToken();
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> unlink(String providerId) async {
    await FirebaseAuth.instance.currentUser?.unlink(providerId);
  }

  static List<String> get providerIds {
    return FirebaseAuth.instance.currentUser?.providerData
            .map((e) => e.providerId)
            .toList() ??
        [];
  }

  static String get googleProviderId {
    return GoogleAuthProvider.PROVIDER_ID;
  }
}
