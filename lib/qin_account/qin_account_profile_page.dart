import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qin_memo/providers/user_provider.dart';

class QinAccountProfilePage extends HookWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> nameState = useState('');
    final ValueNotifier<String> userNameState = useState('');
    final user =
        useProvider(userProvider('testuser').select((value) => value.user));
    final UserNotifier userNotifier =
        useProvider(userProvider('testuser').notifier);
    final ValueNotifier<File?> imageFileState = useState<File?>(null);

    final ImagePicker picker = ImagePicker();

    useEffect(() {
      Future<void>.microtask(() {
        nameState.value = user?.name ?? '';
      });
    });

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('プロフィール',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
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
                          child: imageFileState.value != null
                              ? Image.file(
                                  imageFileState.value!,
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  image: NetworkImage(user?.avatarUrl ??
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                  fit: BoxFit.cover,
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
                          onPressed: () async {
                            final PickedFile? pickedFile = await picker
                                .getImage(source: ImageSource.gallery);
                            final String? path = pickedFile?.path;
                            imageFileState.value =
                                path != null ? File(path) : null;
                          },
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
                          TextFormField(
                            initialValue: user?.name,
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
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              if (value != null) {
                                nameState.value = value;
                              }
                            },
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
                            onChanged: (String value) {
                              userNameState.value = value;
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
                          Text(
                            'https://memo.qin.page/${userNameState.value}',
                            style: const TextStyle(
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
                            FocusScope.of(context).unfocus();
                            final FormState? currentState =
                                _formKey.currentState;
                            if (currentState == null) {
                              return;
                            }
                            if (currentState.validate()) {
                              currentState.save();
                              await userNotifier.update(name: nameState.value);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'エラーが発生しました',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 1000),
                                // width: 162,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: const Color(0xFFEF4444),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
        ),
      ),
    );
  }
}
