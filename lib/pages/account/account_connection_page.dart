import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qin_memo/pages/account/account_app_bar.dart';
import 'package:qin_memo/util/custom_color_scheme.dart';
import 'package:qin_memo/models/authentication.dart';

class AccountConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AccountAppBar(icon: const Icon(Icons.arrow_back_ios)),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('アカウントの連携', style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ConnectionRow(
                    text: 'Google',
                    providerId: googleProviderId,
                  ),
                  const ConnectionRow(text: 'Apple', providerId: 'apple.com')
                ],
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}

class ConnectionRow extends HookWidget {
  const ConnectionRow({required this.text, required this.providerId});

  final String text;
  final String providerId;

  @override
  Widget build(BuildContext context) {
    final providerState = useState<List<String>>(providerIds);
    final isConnected = providerState.value.any((id) => id == providerId);

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
                child: SvgPicture.asset(
                  text == 'Google' ? 'assets/google.svg' : 'assets/apple.svg',
                  color: text == 'Google'
                      ? null
                      : Theme.of(context).colorScheme.appleColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: Theme.of(context).textTheme.subtitle1,
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
            onPressed: () async {
              await unlink(providerId);
              providerState.value =
                  providerState.value.where((e) => e != providerId).toList();
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
            onPressed: () async {
              if (providerId == googleProviderId) {
                await signInWithGoogle();
                providerState.value = [
                  ...providerState.value,
                  googleProviderId
                ];
                return;
              }
              // TODO: Appleの処理も追加する
            },
          ),
      ],
    );
  }
}
