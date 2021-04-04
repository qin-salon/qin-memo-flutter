import 'package:freezed_annotation/freezed_annotation.dart';

import 'note_model.dart';
part 'search_notes_response.freezed.dart';
part 'search_notes_response.g.dart';

@freezed
class SearchNotesResponse with _$SearchNotesResponse {
  const factory SearchNotesResponse({required List<Note> notes}) =
      _SearchNotesResponse;
  factory SearchNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchNotesResponseFromJson(json);
}
