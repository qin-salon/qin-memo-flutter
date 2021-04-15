// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchHistory _$_$_SearchHistoryFromJson(Map<String, dynamic> json) {
  return _$_SearchHistory(
    id: json['id'] as String,
    keyword: json['keyword'] as String,
    createdOn: json['createdOn'] as String,
  );
}

Map<String, dynamic> _$_$_SearchHistoryToJson(_$_SearchHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'createdOn': instance.createdOn,
    };
