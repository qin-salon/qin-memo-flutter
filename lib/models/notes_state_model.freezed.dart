// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notes_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotesState _$NotesStateFromJson(Map<String, dynamic> json) {
  return _NotesState.fromJson(json);
}

/// @nodoc
class _$NotesStateTearOff {
  const _$NotesStateTearOff();

  _NotesState call({List<Note> notes = const <Note>[], bool loading = true}) {
    return _NotesState(
      notes: notes,
      loading: loading,
    );
  }

  NotesState fromJson(Map<String, Object> json) {
    return NotesState.fromJson(json);
  }
}

/// @nodoc
const $NotesState = _$NotesStateTearOff();

/// @nodoc
mixin _$NotesState {
  List<Note> get notes => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res>;
  $Res call({List<Note> notes, bool loading});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res> implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  final NotesState _value;
  // ignore: unused_field
  final $Res Function(NotesState) _then;

  @override
  $Res call({
    Object? notes = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NotesStateCopyWith<$Res> implements $NotesStateCopyWith<$Res> {
  factory _$NotesStateCopyWith(
          _NotesState value, $Res Function(_NotesState) then) =
      __$NotesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes, bool loading});
}

/// @nodoc
class __$NotesStateCopyWithImpl<$Res> extends _$NotesStateCopyWithImpl<$Res>
    implements _$NotesStateCopyWith<$Res> {
  __$NotesStateCopyWithImpl(
      _NotesState _value, $Res Function(_NotesState) _then)
      : super(_value, (v) => _then(v as _NotesState));

  @override
  _NotesState get _value => super._value as _NotesState;

  @override
  $Res call({
    Object? notes = freezed,
    Object? loading = freezed,
  }) {
    return _then(_NotesState(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_NotesState implements _NotesState {
  _$_NotesState({this.notes = const <Note>[], this.loading = true});

  factory _$_NotesState.fromJson(Map<String, dynamic> json) =>
      _$_$_NotesStateFromJson(json);

  @JsonKey(defaultValue: const <Note>[])
  @override
  final List<Note> notes;
  @JsonKey(defaultValue: true)
  @override
  final bool loading;

  @override
  String toString() {
    return 'NotesState(notes: $notes, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotesState &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$NotesStateCopyWith<_NotesState> get copyWith =>
      __$NotesStateCopyWithImpl<_NotesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotesStateToJson(this);
  }
}

abstract class _NotesState implements NotesState {
  factory _NotesState({List<Note> notes, bool loading}) = _$_NotesState;

  factory _NotesState.fromJson(Map<String, dynamic> json) =
      _$_NotesState.fromJson;

  @override
  List<Note> get notes => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotesStateCopyWith<_NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}
