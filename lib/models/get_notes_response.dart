import 'package:freezed_annotation/freezed_annotation.dart';

import 'note_model.dart';
part 'get_notes_response.freezed.dart';
part 'get_notes_response.g.dart';

@freezed
class GetNotesResponse with _$GetNotesResponse {
  const factory GetNotesResponse({required List<Note> notes}) =
      _GetNotesResponse;
  factory GetNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotesResponseFromJson(json);
}
