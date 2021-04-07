import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/user_model.dart';
import 'package:qin_memo/providers/user_provider.dart';

final StateProvider<String> nameStateProvider =
    StateProvider<String>((ProviderReference ref) {
  final User? user = ref.watch<User?>(userProvider);
  if (user == null) {
    return '';
  }
  return user.name;
});

final StateProvider<String> userNameStateProvider =
    StateProvider<String>((ProviderReference ref) => '');

class QinAccountProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final StateController<String> nameState = useProvider(nameStateProvider);
    final StateController<String> userNameState =
        useProvider(userNameStateProvider);
    final User? user = useProvider(userProvider);
    final UserNotifier userNotifier = useProvider(userProvider.notifier);

    final TextEditingController _nameController = useTextEditingController();
    final TextEditingController _userNameController =
        useTextEditingController();
    _nameController.text = nameState.state;
    _nameController.selection = TextSelection.fromPosition(
      TextPosition(offset: _nameController.text.length),
    );
    _userNameController.text = userNameState.state;
    _userNameController.selection = TextSelection.fromPosition(
      TextPosition(offset: _userNameController.text.length),
    );

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
                        child: Image(
                          image: NetworkImage(user?.avatarUrl ??
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
                      children: <Widget>[
                        const Text(
                          '名前',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFC2C6D2),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _nameController,
                          onChanged: (String value) {
                            nameState.state = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            hintText: '名前',
                            hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                            filled: true,
                            fillColor: Color(0xFFF1F5F9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'ユーザー名',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFC2C6D2),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _userNameController,
                          onChanged: (String value) {
                            userNameState.state = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 16),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide.none),
                            hintText: 'ユーザー名',
                            hintStyle: TextStyle(color: Color(0xFFC2C6D2)),
                            filled: true,
                            fillColor: Color(0xFFF1F5F9),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
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
                      onPressed: () async {
                        try {
                          await userNotifier.update(name: nameState.state);
                          print('こうしんしました');
                        } catch (e) {
                          print(e);
                        }
                      },
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
