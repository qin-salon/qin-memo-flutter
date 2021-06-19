import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qin_memo/providers/user_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:qin_memo/util/custom_color_scheme.dart';
import 'package:qin_memo/widgets/snack_bar/error_snack_bar.dart';
import 'package:qin_memo/widgets/snack_bar/success_snack_bar.dart';

class QinAccountProfilePage extends HookWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String createAvatarUrl(String userId) {
    final filePath = Uri.encodeComponent('thumbnails/${userId}_200x200');
    const url = String.fromEnvironment('FIRE_STORAGE_URL');
    return '$url/$filePath?alt=media';
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> nameState = useState('');
    final ValueNotifier<String> accountIdState = useState('');
    final user = useProvider(userProvider.select((value) => value.user));
    final UserNotifier userNotifier = useProvider(userProvider.notifier);
    final ValueNotifier<File?> imageFileState = useState<File?>(null);

    final ImagePicker picker = ImagePicker();

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
              Text('プロフィール', style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'アイコン',
                      style: Theme.of(context).textTheme.subtitle2,
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
                              : Image.network(
                                  user?.avatarUrl ??
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                  errorBuilder: (_, __, ___) {
                                    return Image.network(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                        fit: BoxFit.cover);
                                  },
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
                            primary: Theme.of(context).backgroundColor,
                            onPrimary:
                                Theme.of(context).textTheme.bodyText1?.color,
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
                          Text(
                            '名前',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                                fontSize: 14),
                            initialValue: user?.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 16,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '名前',
                              hintStyle:
                                  const TextStyle(color: Color(0xFFC2C6D2)),
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
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
                          Text(
                            'ユーザー名',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                                fontSize: 14),
                            initialValue: user?.accountId,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 16,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'ユーザー名',
                              hintStyle:
                                  const TextStyle(color: Color(0xFFC2C6D2)),
                              filled: true,
                              fillColor: Theme.of(context).backgroundColor,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              if (value != null) {
                                accountIdState.value = value;
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'https://memo.qin.page/${accountIdState.value == '' ? user?.accountId : accountIdState.value}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .subTextColor),
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          elevation: 0,
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
                              if (user == null) {
                                return;
                              }
                              final storage =
                                  firebase_storage.FirebaseStorage.instance;
                              final file = imageFileState.value;
                              if (file != null) {
                                await storage.ref(user.id).putFile(file);
                              }
                              await userNotifier.update(
                                user: user.copyWith(
                                  name: nameState.value,
                                  accountId: accountIdState.value,
                                  avatarUrl: file == null
                                      ? user.avatarUrl
                                      : createAvatarUrl(user.id),
                                ),
                              );
                              await NetworkImage(user.avatarUrl).evict();
                            }
                            showSuccessSnackBar(
                              context: context,
                              content: Row(
                                children: const <Widget>[
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '保存しました',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              width: 126,
                            );
                          } catch (e) {
                            showErrorSnackBar(context);
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
