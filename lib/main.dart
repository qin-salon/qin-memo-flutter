import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final TextTheme appBarTextTheme = Typography.material2018().black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qin Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            textTheme: appBarTextTheme.copyWith(
                headline6: appBarTextTheme.headline6
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold))),
      ),
      home: HomePage(),
    );
  }
}
