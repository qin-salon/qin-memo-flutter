import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qin_memo/models/api.dart';
import 'package:qin_memo/models/note_model.dart';
import 'package:qin_memo/models/notes_state_model.dart';
import 'package:qin_memo/providers/user_provider.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>(
    (ProviderReference ref) => NotesNotifier(ref));

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier(this._ref) : super(NotesState()) {
    () async {
      final userId = _ref.watch(userProvider).user?.id;
      if (userId == null) {
        state = state.copyWith(notes: [], loading: false);
        return;
      }
      state = state.copyWith(
          notes: await _ref.read(fetchNotes(userId).future), loading: false);
    }();
  }

  final ProviderReference _ref;

  Future<String> add() async {
    final userId = _ref.read(userProvider).user?.id;
    if (userId == null) {
      throw Exception('userId is null');
    }
    final note = await _ref.read(createNote(userId).future);
    final notes = <Note>[note, ...state.notes];
    state = state.copyWith(notes: notes);
    return note.id;
  }

  Future<void> update({required Note note}) async {
    final responseNote = await _ref.read(updateNote(note).future);
    final notes = <Note>[
      responseNote,
      ...state.notes.where((Note value) => value.id != note.id)
    ];
    state = state.copyWith(notes: notes);
  }

  Future<void> updateState({required Note note}) async {
    final notes = <Note>[
      note,
      ...state.notes.where((Note value) => value.id != note.id)
    ];
    state = state.copyWith(notes: notes);
  }

  Future<void> patch({required String noteId}) async {
    final note = await _ref.read(patchNote(noteId).future);
    final notes = <Note>[
      note,
      ...state.notes.where((Note value) => value.id != noteId).toList(),
    ];
    state = state.copyWith(notes: notes);
  }

  Future<void> delete({required String noteId}) async {
    await _ref.read(deleteNote(noteId).future);
    final notes = state.notes.where((Note note) => note.id != noteId).toList();
    state = state.copyWith(notes: notes);
  }
}
