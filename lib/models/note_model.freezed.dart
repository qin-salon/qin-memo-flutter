// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
class _$NoteTearOff {
  const _$NoteTearOff();

  _Note call(
      {required String id, required String excerpt, required bool public}) {
    return _Note(
      id: id,
      excerpt: excerpt,
      public: public,
    );
  }

  Note fromJson(Map<String, Object> json) {
    return Note.fromJson(json);
  }
}

/// @nodoc
const $Note = _$NoteTearOff();

/// @nodoc
mixin _$Note {
  String get id => throw _privateConstructorUsedError;
  String get excerpt => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res>;
  $Res call({String id, String excerpt, bool public});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  final Note _value;
  // ignore: unused_field
  final $Res Function(Note) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? excerpt = freezed,
    Object? public = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$NoteCopyWith(_Note value, $Res Function(_Note) then) =
      __$NoteCopyWithImpl<$Res>;
  @override
  $Res call({String id, String excerpt, bool public});
}

/// @nodoc
class __$NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$NoteCopyWith<$Res> {
  __$NoteCopyWithImpl(_Note _value, $Res Function(_Note) _then)
      : super(_value, (v) => _then(v as _Note));

  @override
  _Note get _value => super._value as _Note;

  @override
  $Res call({
    Object? id = freezed,
    Object? excerpt = freezed,
    Object? public = freezed,
  }) {
    return _then(_Note(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: excerpt == freezed
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Note implements _Note {
  const _$_Note(
      {required this.id, required this.excerpt, required this.public});

  factory _$_Note.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteFromJson(json);

  @override
  final String id;
  @override
  final String excerpt;
  @override
  final bool public;

  @override
  String toString() {
    return 'Note(id: $id, excerpt: $excerpt, public: $public)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Note &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.excerpt, excerpt) ||
                const DeepCollectionEquality()
                    .equals(other.excerpt, excerpt)) &&
            (identical(other.public, public) ||
                const DeepCollectionEquality().equals(other.public, public)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(excerpt) ^
      const DeepCollectionEquality().hash(public);

  @JsonKey(ignore: true)
  @override
  _$NoteCopyWith<_Note> get copyWith =>
      __$NoteCopyWithImpl<_Note>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteToJson(this);
  }
}

abstract class _Note implements Note {
  const factory _Note(
      {required String id,
      required String excerpt,
      required bool public}) = _$_Note;

  factory _Note.fromJson(Map<String, dynamic> json) = _$_Note.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get excerpt => throw _privateConstructorUsedError;
  @override
  bool get public => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteCopyWith<_Note> get copyWith => throw _privateConstructorUsedError;
}
