// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_histories_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchHistoriesState _$_$_SearchHistoriesStateFromJson(
    Map<String, dynamic> json) {
  return _$_SearchHistoriesState(
    histories: (json['histories'] as List<dynamic>?)
            ?.map((e) => SearchHistory.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    loading: json['loading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_SearchHistoriesStateToJson(
        _$_SearchHistoriesState instance) =>
    <String, dynamic>{
      'histories': instance.histories,
      'loading': instance.loading,
    };
