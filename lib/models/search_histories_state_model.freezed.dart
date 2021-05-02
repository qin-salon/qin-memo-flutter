// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_histories_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchHistoriesState _$SearchHistoriesStateFromJson(Map<String, dynamic> json) {
  return _SearchHistoriesState.fromJson(json);
}

/// @nodoc
class _$SearchHistoriesStateTearOff {
  const _$SearchHistoriesStateTearOff();

  _SearchHistoriesState call(
      {List<SearchHistory> histories = const <SearchHistory>[],
      bool loading = true}) {
    return _SearchHistoriesState(
      histories: histories,
      loading: loading,
    );
  }

  SearchHistoriesState fromJson(Map<String, Object> json) {
    return SearchHistoriesState.fromJson(json);
  }
}

/// @nodoc
const $SearchHistoriesState = _$SearchHistoriesStateTearOff();

/// @nodoc
mixin _$SearchHistoriesState {
  List<SearchHistory> get histories => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchHistoriesStateCopyWith<SearchHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoriesStateCopyWith<$Res> {
  factory $SearchHistoriesStateCopyWith(SearchHistoriesState value,
          $Res Function(SearchHistoriesState) then) =
      _$SearchHistoriesStateCopyWithImpl<$Res>;
  $Res call({List<SearchHistory> histories, bool loading});
}

/// @nodoc
class _$SearchHistoriesStateCopyWithImpl<$Res>
    implements $SearchHistoriesStateCopyWith<$Res> {
  _$SearchHistoriesStateCopyWithImpl(this._value, this._then);

  final SearchHistoriesState _value;
  // ignore: unused_field
  final $Res Function(SearchHistoriesState) _then;

  @override
  $Res call({
    Object? histories = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      histories: histories == freezed
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistory>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SearchHistoriesStateCopyWith<$Res>
    implements $SearchHistoriesStateCopyWith<$Res> {
  factory _$SearchHistoriesStateCopyWith(_SearchHistoriesState value,
          $Res Function(_SearchHistoriesState) then) =
      __$SearchHistoriesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SearchHistory> histories, bool loading});
}

/// @nodoc
class __$SearchHistoriesStateCopyWithImpl<$Res>
    extends _$SearchHistoriesStateCopyWithImpl<$Res>
    implements _$SearchHistoriesStateCopyWith<$Res> {
  __$SearchHistoriesStateCopyWithImpl(
      _SearchHistoriesState _value, $Res Function(_SearchHistoriesState) _then)
      : super(_value, (v) => _then(v as _SearchHistoriesState));

  @override
  _SearchHistoriesState get _value => super._value as _SearchHistoriesState;

  @override
  $Res call({
    Object? histories = freezed,
    Object? loading = freezed,
  }) {
    return _then(_SearchHistoriesState(
      histories: histories == freezed
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<SearchHistory>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchHistoriesState implements _SearchHistoriesState {
  _$_SearchHistoriesState(
      {this.histories = const <SearchHistory>[], this.loading = true});

  factory _$_SearchHistoriesState.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchHistoriesStateFromJson(json);

  @JsonKey(defaultValue: const <SearchHistory>[])
  @override
  final List<SearchHistory> histories;
  @JsonKey(defaultValue: true)
  @override
  final bool loading;

  @override
  String toString() {
    return 'SearchHistoriesState(histories: $histories, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchHistoriesState &&
            (identical(other.histories, histories) ||
                const DeepCollectionEquality()
                    .equals(other.histories, histories)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(histories) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$SearchHistoriesStateCopyWith<_SearchHistoriesState> get copyWith =>
      __$SearchHistoriesStateCopyWithImpl<_SearchHistoriesState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchHistoriesStateToJson(this);
  }
}

abstract class _SearchHistoriesState implements SearchHistoriesState {
  factory _SearchHistoriesState({List<SearchHistory> histories, bool loading}) =
      _$_SearchHistoriesState;

  factory _SearchHistoriesState.fromJson(Map<String, dynamic> json) =
      _$_SearchHistoriesState.fromJson;

  @override
  List<SearchHistory> get histories => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchHistoriesStateCopyWith<_SearchHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
