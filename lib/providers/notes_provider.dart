import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/notes_state_model.dart';

final notesProvider =
    StateNotifierProvider.family<NotesNotifier, NotesState, String>(
        (ProviderReference ref, String userId) =>
            NotesNotifier(ref.read, userId));

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier(this._read, this._userId) : super(NotesState()) {
    () async {
      state = state.copyWith(
          notes: await _read(fetchNotes(_userId).future), loading: false);
    }();
  }

  final Reader _read;
  final String _userId;

  Future<String> add() async {
    final note = await _read(createNote('testuser').future);
    final notes = <Note>[note, ...state.notes];
    state = state.copyWith(notes: notes);
    return note.id;
  }

  Future<void> update({required Note note}) async {
    final responseNote = await _read(updateNote(note).future);
    final notes = <Note>[
      responseNote,
      ...state.notes.where((Note value) => value.id != note.id)
    ];
    state = state.copyWith(notes: notes);
  }

  Future<void> patch({required String noteId}) async {
    final note = await _read(patchNote(noteId).future);
    final notes = <Note>[
      note,
      ...state.notes.where((Note value) => value.id != noteId).toList(),
    ];
    state = state.copyWith(notes: notes);
  }

  Future<void> delete({required String noteId}) async {
    await _read(deleteNote(noteId).future);
    final notes = state.notes.where((Note note) => note.id != noteId).toList();
    state = state.copyWith(notes: notes);
  }
}
