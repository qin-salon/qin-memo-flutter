import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QinAccountConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          title: const Text('Qinアカウント'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('アカウントの連携',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  ConnectionRow(
                    text: 'Google',
                  ),
                  ConnectionRow(
                    text: 'Apple',
                  )
                ],
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}

class ConnectionRow extends HookWidget {
  const ConnectionRow({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final providerState = useState<List<String>>(FirebaseAuth
            .instance.currentUser?.providerData
            .map((e) => e.providerId)
            .toList() ??
        []);

    final isConnected = text == 'Google' &&
            providerState.value.any((id) => id == 'google.com') ||
        text == 'Apple' && providerState.value.any((id) => id == 'apple.com');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                child: SvgPicture.asset(text == 'Google'
                    ? 'assets/google.svg'
                    : 'assets/apple.svg'),
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        if (isConnected)
          ElevatedButton(
            child: const Text(
              '解除する',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color(0xFFF1F5F9),
              onPrimary: Colors.black,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              FirebaseAuth.instance.currentUser?.unlink('google.com');
            },
          ),
        if (!isConnected)
          ElevatedButton(
            child: const Text(
              '連携する',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color(0xFF3B82F6),
              onPrimary: Colors.white,
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
          ),
      ],
    );
  }
}
