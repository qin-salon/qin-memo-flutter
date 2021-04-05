// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$_$_NoteFromJson(Map<String, dynamic> json) {
  return _$_Note(
    id: json['id'] as String,
    public: json['public'] as bool,
    excerpt: json['excerpt'] as String?,
    content: json['content'] as String?,
  );
}

Map<String, dynamic> _$_$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'public': instance.public,
      'excerpt': instance.excerpt,
      'content': instance.content,
    };
