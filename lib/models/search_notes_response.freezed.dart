// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_notes_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchNotesResponse _$SearchNotesResponseFromJson(Map<String, dynamic> json) {
  return _SearchNotesResponse.fromJson(json);
}

/// @nodoc
class _$SearchNotesResponseTearOff {
  const _$SearchNotesResponseTearOff();

  _SearchNotesResponse call({required List<Note> notes}) {
    return _SearchNotesResponse(
      notes: notes,
    );
  }

  SearchNotesResponse fromJson(Map<String, Object> json) {
    return SearchNotesResponse.fromJson(json);
  }
}

/// @nodoc
const $SearchNotesResponse = _$SearchNotesResponseTearOff();

/// @nodoc
mixin _$SearchNotesResponse {
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchNotesResponseCopyWith<SearchNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchNotesResponseCopyWith<$Res> {
  factory $SearchNotesResponseCopyWith(
          SearchNotesResponse value, $Res Function(SearchNotesResponse) then) =
      _$SearchNotesResponseCopyWithImpl<$Res>;
  $Res call({List<Note> notes});
}

/// @nodoc
class _$SearchNotesResponseCopyWithImpl<$Res>
    implements $SearchNotesResponseCopyWith<$Res> {
  _$SearchNotesResponseCopyWithImpl(this._value, this._then);

  final SearchNotesResponse _value;
  // ignore: unused_field
  final $Res Function(SearchNotesResponse) _then;

  @override
  $Res call({
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
abstract class _$SearchNotesResponseCopyWith<$Res>
    implements $SearchNotesResponseCopyWith<$Res> {
  factory _$SearchNotesResponseCopyWith(_SearchNotesResponse value,
          $Res Function(_SearchNotesResponse) then) =
      __$SearchNotesResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes});
}

/// @nodoc
class __$SearchNotesResponseCopyWithImpl<$Res>
    extends _$SearchNotesResponseCopyWithImpl<$Res>
    implements _$SearchNotesResponseCopyWith<$Res> {
  __$SearchNotesResponseCopyWithImpl(
      _SearchNotesResponse _value, $Res Function(_SearchNotesResponse) _then)
      : super(_value, (v) => _then(v as _SearchNotesResponse));

  @override
  _SearchNotesResponse get _value => super._value as _SearchNotesResponse;

  @override
  $Res call({
    Object? notes = freezed,
  }) {
    return _then(_SearchNotesResponse(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchNotesResponse implements _SearchNotesResponse {
  const _$_SearchNotesResponse({required this.notes});

  factory _$_SearchNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchNotesResponseFromJson(json);

  @override
  final List<Note> notes;

  @override
  String toString() {
    return 'SearchNotesResponse(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchNotesResponse &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notes);

  @JsonKey(ignore: true)
  @override
  _$SearchNotesResponseCopyWith<_SearchNotesResponse> get copyWith =>
      __$SearchNotesResponseCopyWithImpl<_SearchNotesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchNotesResponseToJson(this);
  }
}

abstract class _SearchNotesResponse implements SearchNotesResponse {
  const factory _SearchNotesResponse({required List<Note> notes}) =
      _$_SearchNotesResponse;

  factory _SearchNotesResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchNotesResponse.fromJson;

  @override
  List<Note> get notes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchNotesResponseCopyWith<_SearchNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
