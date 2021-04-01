import 'package:flutter/material.dart';

class QinAccountProfilePage extends StatelessWidget {
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
              const Text('プロフィール',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'アイコン',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFC2C6D2),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: const Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        child: const Text(
                          '変更する',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(0xFFF1F5F9),
                          onPrimary: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          '名前',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFC2C6D2),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide.none),
                              hintText: '名前',
                              hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                              filled: true,
                              fillColor: Color(0xFFF1F5F9)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'ユーザー名',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFC2C6D2),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide.none),
                              hintText: 'ユーザー名',
                              hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                              filled: true,
                              fillColor: Color(0xFFF1F5F9)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'https://memo.qin.page/shimabu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFC2C6D2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text(
                        '保存する',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: const Color(0xFF3B82F6),
                        onPrimary: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ));
  }
}
