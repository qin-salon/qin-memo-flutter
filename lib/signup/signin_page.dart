import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1F5F9),
        ),
        backgroundColor: const Color(0xFFF1F5F9),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              SvgPicture.asset(
                'assets/logo.svg',
              ),
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/google.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Googleでログイン',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    final googleUser = await GoogleSignIn().signIn();
                    final googleAuth = await googleUser?.authentication;
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth?.accessToken,
                      idToken: googleAuth?.idToken,
                    );
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                  },
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/apple.svg',
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Appleでログイン',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
