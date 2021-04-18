import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: ElevatedButton(
              child: const Text(
                'Googleでサインアップ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color(0xFFF1F5F9),
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
