// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$_$_NoteFromJson(Map<String, dynamic> json) {
  return _$_Note(
    id: json['id'] as String,
    excerpt: json['excerpt'] as String,
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$_$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'excerpt': instance.excerpt,
      'public': instance.public,
    };
