// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotesState _$_$_NotesStateFromJson(Map<String, dynamic> json) {
  return _$_NotesState(
    notes: (json['notes'] as List<dynamic>?)
            ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    loading: json['loading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_NotesStateToJson(_$_NotesState instance) =>
    <String, dynamic>{
      'notes': instance.notes,
      'loading': instance.loading,
    };
