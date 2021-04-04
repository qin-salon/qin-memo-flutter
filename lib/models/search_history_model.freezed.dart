// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchHistory _$SearchHistoryFromJson(Map<String, dynamic> json) {
  return _SearchHistory.fromJson(json);
}

/// @nodoc
class _$SearchHistoryTearOff {
  const _$SearchHistoryTearOff();

  _SearchHistory call({required String id, required String keyword}) {
    return _SearchHistory(
      id: id,
      keyword: keyword,
    );
  }

  SearchHistory fromJson(Map<String, Object> json) {
    return SearchHistory.fromJson(json);
  }
}

/// @nodoc
const $SearchHistory = _$SearchHistoryTearOff();

/// @nodoc
mixin _$SearchHistory {
  String get id => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchHistoryCopyWith<SearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryCopyWith<$Res> {
  factory $SearchHistoryCopyWith(
          SearchHistory value, $Res Function(SearchHistory) then) =
      _$SearchHistoryCopyWithImpl<$Res>;
  $Res call({String id, String keyword});
}

/// @nodoc
class _$SearchHistoryCopyWithImpl<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  _$SearchHistoryCopyWithImpl(this._value, this._then);

  final SearchHistory _value;
  // ignore: unused_field
  final $Res Function(SearchHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchHistoryCopyWith<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  factory _$SearchHistoryCopyWith(
          _SearchHistory value, $Res Function(_SearchHistory) then) =
      __$SearchHistoryCopyWithImpl<$Res>;
  @override
  $Res call({String id, String keyword});
}

/// @nodoc
class __$SearchHistoryCopyWithImpl<$Res>
    extends _$SearchHistoryCopyWithImpl<$Res>
    implements _$SearchHistoryCopyWith<$Res> {
  __$SearchHistoryCopyWithImpl(
      _SearchHistory _value, $Res Function(_SearchHistory) _then)
      : super(_value, (v) => _then(v as _SearchHistory));

  @override
  _SearchHistory get _value => super._value as _SearchHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_SearchHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchHistory implements _SearchHistory {
  const _$_SearchHistory({required this.id, required this.keyword});

  factory _$_SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchHistoryFromJson(json);

  @override
  final String id;
  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchHistory(id: $id, keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality().equals(other.keyword, keyword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(keyword);

  @JsonKey(ignore: true)
  @override
  _$SearchHistoryCopyWith<_SearchHistory> get copyWith =>
      __$SearchHistoryCopyWithImpl<_SearchHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchHistoryToJson(this);
  }
}

abstract class _SearchHistory implements SearchHistory {
  const factory _SearchHistory({required String id, required String keyword}) =
      _$_SearchHistory;

  factory _SearchHistory.fromJson(Map<String, dynamic> json) =
      _$_SearchHistory.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get keyword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchHistoryCopyWith<_SearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
