import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qin_memo/models/note_model.dart';

part 'notes_state_model.freezed.dart';
part 'notes_state_model.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    @Default(<Note>[]) List<Note> notes,
    @Default(true) bool loading,
  }) = _NotesState;
  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
