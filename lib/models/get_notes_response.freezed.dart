// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'get_notes_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetNotesResponse _$GetNotesResponseFromJson(Map<String, dynamic> json) {
  return _GetNotesResponse.fromJson(json);
}

/// @nodoc
class _$GetNotesResponseTearOff {
  const _$GetNotesResponseTearOff();

  _GetNotesResponse call({required List<Note> notes}) {
    return _GetNotesResponse(
      notes: notes,
    );
  }

  GetNotesResponse fromJson(Map<String, Object> json) {
    return GetNotesResponse.fromJson(json);
  }
}

/// @nodoc
const $GetNotesResponse = _$GetNotesResponseTearOff();

/// @nodoc
mixin _$GetNotesResponse {
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotesResponseCopyWith<GetNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotesResponseCopyWith<$Res> {
  factory $GetNotesResponseCopyWith(
          GetNotesResponse value, $Res Function(GetNotesResponse) then) =
      _$GetNotesResponseCopyWithImpl<$Res>;
  $Res call({List<Note> notes});
}

/// @nodoc
class _$GetNotesResponseCopyWithImpl<$Res>
    implements $GetNotesResponseCopyWith<$Res> {
  _$GetNotesResponseCopyWithImpl(this._value, this._then);

  final GetNotesResponse _value;
  // ignore: unused_field
  final $Res Function(GetNotesResponse) _then;

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
abstract class _$GetNotesResponseCopyWith<$Res>
    implements $GetNotesResponseCopyWith<$Res> {
  factory _$GetNotesResponseCopyWith(
          _GetNotesResponse value, $Res Function(_GetNotesResponse) then) =
      __$GetNotesResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes});
}

/// @nodoc
class __$GetNotesResponseCopyWithImpl<$Res>
    extends _$GetNotesResponseCopyWithImpl<$Res>
    implements _$GetNotesResponseCopyWith<$Res> {
  __$GetNotesResponseCopyWithImpl(
      _GetNotesResponse _value, $Res Function(_GetNotesResponse) _then)
      : super(_value, (v) => _then(v as _GetNotesResponse));

  @override
  _GetNotesResponse get _value => super._value as _GetNotesResponse;

  @override
  $Res call({
    Object? notes = freezed,
  }) {
    return _then(_GetNotesResponse(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GetNotesResponse implements _GetNotesResponse {
  const _$_GetNotesResponse({required this.notes});

  factory _$_GetNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GetNotesResponseFromJson(json);

  @override
  final List<Note> notes;

  @override
  String toString() {
    return 'GetNotesResponse(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetNotesResponse &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notes);

  @JsonKey(ignore: true)
  @override
  _$GetNotesResponseCopyWith<_GetNotesResponse> get copyWith =>
      __$GetNotesResponseCopyWithImpl<_GetNotesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetNotesResponseToJson(this);
  }
}

abstract class _GetNotesResponse implements GetNotesResponse {
  const factory _GetNotesResponse({required List<Note> notes}) =
      _$_GetNotesResponse;

  factory _GetNotesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetNotesResponse.fromJson;

  @override
  List<Note> get notes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetNotesResponseCopyWith<_GetNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
