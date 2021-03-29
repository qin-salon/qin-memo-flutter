import 'package:flutter/material.dart';

class ProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 228,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'しまぶー',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF070417),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        '@shimabuit',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC2C6D2),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            const DialogOption(
              icon: Icon(Icons.settings_outlined),
              text: Text(
                '設定',
                style: TextStyle(
                  color: Color(0xFF070417),
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const DialogOption(
              icon: Icon(Icons.help_outline_outlined),
              text: Text(
                'ヘルプ',
                style: TextStyle(
                  color: Color(0xFF070417),
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const DialogOption(
              icon: Icon(
                Icons.logout,
                color: Color(0xFFEF4444),
              ),
              text: Text(
                'ログアウト',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
        margin: const EdgeInsets.only(top: 100, left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}

class DialogOption extends StatelessWidget {
  const DialogOption({Key key, @required this.icon, @required this.text})
      : super(key: key);

  final Icon icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(width: 16),
          text,
        ],
      ),
    );
  }
}
