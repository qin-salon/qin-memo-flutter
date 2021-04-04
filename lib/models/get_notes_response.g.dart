// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetNotesResponse _$_$_GetNotesResponseFromJson(Map<String, dynamic> json) {
  return _$_GetNotesResponse(
    notes: (json['notes'] as List<dynamic>)
        .map((e) => Note.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_GetNotesResponseToJson(
        _$_GetNotesResponse instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
