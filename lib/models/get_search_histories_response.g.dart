// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_histories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetSearchHistoriesResponse _$_$_GetSearchHistoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _$_GetSearchHistoriesResponse(
    searchHistories: (json['searchHistories'] as List<dynamic>)
        .map((e) => SearchHistory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_GetSearchHistoriesResponseToJson(
        _$_GetSearchHistoriesResponse instance) =>
    <String, dynamic>{
      'searchHistories': instance.searchHistories,
    };
