// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    name: json['name'] as String,
    accountId: json['accountId'] as String,
    avatarUrl: json['avatarUrl'] as String,
    enabledQinMemo: json['enabledQinMemo'] as bool,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountId': instance.accountId,
      'avatarUrl': instance.avatarUrl,
      'enabledQinMemo': instance.enabledQinMemo,
    };

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    loading: json['loading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'user': instance.user,
      'loading': instance.loading,
    };
