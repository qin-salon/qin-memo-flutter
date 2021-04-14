import 'package:flutter/material.dart';

import '../custom_alert_dialog.dart';

class QinAccountDeletePage extends StatelessWidget {
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
              const Text(
                'データの削除',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Qinサービスの削除',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC2C6D2),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Qin Memoを削除',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          child: const Text(
                            '削除する',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color(0xFFF1F5F9),
                            onPrimary: const Color(0xFFEF4444),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            showDialog<CustomAlertDialog>(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: 'Qin Memoを削除',
                                  subText: 'Qin Memoを完全に削除してよろしいですか？',
                                  actionText: 'OK',
                                  action: () => print('logout'),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 54),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Qinアカウントの削除',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC2C6D2),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'アカウントを削除',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          child: const Text(
                            '削除する',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color(0xFFF1F5F9),
                            onPrimary: const Color(0xFFEF4444),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            showDialog<CustomAlertDialog>(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: 'Qinアカウントの削除',
                                  subText: 'Qinアカウントを完全に削除してよろしいですか？',
                                  actionText: 'OK',
                                  action: () => print('logout'),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}
