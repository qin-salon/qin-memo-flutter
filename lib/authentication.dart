import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  final googleUser = await GoogleSignIn().signIn();
  final googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<String?> getIdToken() async {
  return await FirebaseAuth.instance.currentUser?.getIdToken();
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

Future<void> unlink(String providerId) async {
  await FirebaseAuth.instance.currentUser?.unlink(providerId);
}

User? get currentUser {
  return FirebaseAuth.instance.currentUser;
}

List<String> get providerIds {
  return FirebaseAuth.instance.currentUser?.providerData
          .map((e) => e.providerId)
          .toList() ??
      [];
}

String get googleProviderId {
  return GoogleAuthProvider.PROVIDER_ID;
}
