import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/providers/notes_provider.dart';

final StateProviderFamily<Note?, String> noteProvider =
    StateProvider.family<Note?, String>((ProviderReference ref, String noteId) {
  final List<Note> notes = ref.watch(notesProvider);
  final Iterable<Note> note = notes.where((Note note) => note.id == noteId);
  if (note.isEmpty) {
    return null;
  }
  return note.first;
});
