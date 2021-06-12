import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String accountId,
    required String avatarUrl,
    required bool enabledQinMemo,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(null) User? user,
    @Default(true) bool loading,
  }) = _UserState;
  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
