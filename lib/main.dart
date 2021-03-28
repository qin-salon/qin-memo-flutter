import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => <void>{
              showGeneralDialog(
                barrierLabel: 'Dismiss',
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 200),
                context: context,
                pageBuilder: (BuildContext context, _, __) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 0),
                          ),
                          Container(
                            height: 44,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.settings_outlined),
                                SizedBox(width: 16),
                                Text(
                                  '設定',
                                  style: TextStyle(
                                      color: Color(0xFF070417),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 44,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.help_outline_outlined),
                                SizedBox(width: 16),
                                Text(
                                  'ヘルプ',
                                  style: TextStyle(
                                      color: Color(0xFF070417),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 44,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                  Icons.logout,
                                  color: Color(0xFFEF4444),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'ログアウト',
                                  style: TextStyle(
                                      color: Color(0xFFEF4444),
                                      fontSize: 14,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      margin:
                          const EdgeInsets.only(top: 100, left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 24),
                    ),
                  );
                },
                transitionBuilder: (BuildContext context,
                    Animation<double> anim1, _, Widget child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0, 0),
                            end: const Offset(0, 0.01))
                        .animate(anim1),
                    child: child,
                  );
                },
              )
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Container(
                width: 36,
                height: 36,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => print('hello'),
        label: const Text(
          'メモを書く',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => <Future<SearchPage>>{
                Navigator.of(context).push<SearchPage>(
                  PageRouteBuilder<SearchPage>(
                    pageBuilder: (_, __, ___) => SearchPage(),
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) =>
                        ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                      child: child,
                    ),
                  ),
                ),
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 10.5),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF3B82F6),
                        )),
                    Text(
                      'メモを検索する',
                      style: TextStyle(color: Color(0xFFC2C6D2)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: const Color(0xFFF1F5F9),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'タイトル',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text('ほそく'),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                '2021/03/25',
                                style: TextStyle(color: Color(0xFFC2C6D2)),
                              ),
                              Container(
                                child: const Text(
                                  '公開中',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999),
                                  color: const Color(0xFFFB923C),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFF1F5F9),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.12),
                                offset: Offset(0, 1),
                                blurRadius: 1)
                          ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              const Flexible(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(44, 13, 0, 13),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFC2C6D2),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                          borderSide: BorderSide.none),
                      hintText: '検索',
                      hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                      filled: true,
                      fillColor: Color(0xFFF1F5F9)),
                ),
              ),
              GestureDetector(
                onTap: () => print('hello'),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Next.js',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => print('hello'),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFFC2C6D2),
                      ),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              ),
            );
          },
        ),
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      ),
    );
  }
}
