import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class Note with _$Note {
  const factory Note(
      {required String id,
      required String excerpt,
      required bool public}) = _Note;
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
