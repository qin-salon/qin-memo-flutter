// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_notes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchNotesResponse _$_$_SearchNotesResponseFromJson(
    Map<String, dynamic> json) {
  return _$_SearchNotesResponse(
    notes: (json['notes'] as List<dynamic>)
        .map((e) => Note.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SearchNotesResponseToJson(
        _$_SearchNotesResponse instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
