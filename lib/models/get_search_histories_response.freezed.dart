// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'get_search_histories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSearchHistoriesResponse _$GetSearchHistoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetSearchHistoriesResponse.fromJson(json);
}

/// @nodoc
class _$GetSearchHistoriesResponseTearOff {
  const _$GetSearchHistoriesResponseTearOff();

  _GetSearchHistoriesResponse call(
      {required List<SearchHistory> searchHistories}) {
    return _GetSearchHistoriesResponse(
      searchHistories: searchHistories,
    );
  }

  GetSearchHistoriesResponse fromJson(Map<String, Object> json) {
    return GetSearchHistoriesResponse.fromJson(json);
  }
}

/// @nodoc
const $GetSearchHistoriesResponse = _$GetSearchHistoriesResponseTearOff();

/// @nodoc
mixin _$GetSearchHistoriesResponse {
  List<SearchHistory> get searchHistories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSearchHistoriesResponseCopyWith<GetSearchHistoriesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSearchHistoriesResponseCopyWith<$Res> {
  factory $GetSearchHistoriesResponseCopyWith(GetSearchHistoriesResponse value,
          $Res Function(GetSearchHistoriesResponse) then) =
      _$GetSearchHistoriesResponseCopyWithImpl<$Res>;
  $Res call({List<SearchHistory> searchHistories});
}

/// @nodoc
class _$GetSearchHistoriesResponseCopyWithImpl<$Res>
    implements $GetSearchHistoriesResponseCopyWith<$Res> {
  _$GetSearchHistoriesResponseCopyWithImpl(this._value, this._then);

  final GetSearchHistoriesResponse _value;
  // ignore: unused_field
  final $Res Function(GetSearchHistoriesResponse) _then;

  @override
  $Res call({
    Object? searchHistories = freezed,
  }) {
    return _then(_value.copyWith(
      searchHistories: searchHistories == freezed
          ? _value.searchHistories
          : searchHistories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistory>,
    ));
  }
}

/// @nodoc
abstract class _$GetSearchHistoriesResponseCopyWith<$Res>
    implements $GetSearchHistoriesResponseCopyWith<$Res> {
  factory _$GetSearchHistoriesResponseCopyWith(
          _GetSearchHistoriesResponse value,
          $Res Function(_GetSearchHistoriesResponse) then) =
      __$GetSearchHistoriesResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<SearchHistory> searchHistories});
}

/// @nodoc
class __$GetSearchHistoriesResponseCopyWithImpl<$Res>
    extends _$GetSearchHistoriesResponseCopyWithImpl<$Res>
    implements _$GetSearchHistoriesResponseCopyWith<$Res> {
  __$GetSearchHistoriesResponseCopyWithImpl(_GetSearchHistoriesResponse _value,
      $Res Function(_GetSearchHistoriesResponse) _then)
      : super(_value, (v) => _then(v as _GetSearchHistoriesResponse));

  @override
  _GetSearchHistoriesResponse get _value =>
      super._value as _GetSearchHistoriesResponse;

  @override
  $Res call({
    Object? searchHistories = freezed,
  }) {
    return _then(_GetSearchHistoriesResponse(
      searchHistories: searchHistories == freezed
          ? _value.searchHistories
          : searchHistories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistory>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GetSearchHistoriesResponse implements _GetSearchHistoriesResponse {
  const _$_GetSearchHistoriesResponse({required this.searchHistories});

  factory _$_GetSearchHistoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GetSearchHistoriesResponseFromJson(json);

  @override
  final List<SearchHistory> searchHistories;

  @override
  String toString() {
    return 'GetSearchHistoriesResponse(searchHistories: $searchHistories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetSearchHistoriesResponse &&
            (identical(other.searchHistories, searchHistories) ||
                const DeepCollectionEquality()
                    .equals(other.searchHistories, searchHistories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchHistories);

  @JsonKey(ignore: true)
  @override
  _$GetSearchHistoriesResponseCopyWith<_GetSearchHistoriesResponse>
      get copyWith => __$GetSearchHistoriesResponseCopyWithImpl<
          _GetSearchHistoriesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetSearchHistoriesResponseToJson(this);
  }
}

abstract class _GetSearchHistoriesResponse
    implements GetSearchHistoriesResponse {
  const factory _GetSearchHistoriesResponse(
          {required List<SearchHistory> searchHistories}) =
      _$_GetSearchHistoriesResponse;

  factory _GetSearchHistoriesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetSearchHistoriesResponse.fromJson;

  @override
  List<SearchHistory> get searchHistories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetSearchHistoriesResponseCopyWith<_GetSearchHistoriesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
