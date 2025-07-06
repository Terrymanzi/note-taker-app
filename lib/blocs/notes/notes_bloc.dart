import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/notes_repository.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _notesRepository;

  NotesBloc({required NotesRepository notesRepository})
    : _notesRepository = notesRepository,
      super(NotesInitial()) {
    on<NotesLoadRequested>(_onLoadRequested);
    on<NotesAddRequested>(_onAddRequested);
    on<NotesUpdateRequested>(_onUpdateRequested);
    on<NotesDeleteRequested>(_onDeleteRequested);
  }

  Future<void> _onLoadRequested(
    NotesLoadRequested event,
    Emitter<NotesState> emit,
  ) async {
    emit(NotesLoading());
    try {
      final notes = await _notesRepository.fetchNotes();
      emit(NotesLoaded(notes: notes));
    } catch (e) {
      emit(NotesError(message: e.toString()));
    }
  }

  Future<void> _onAddRequested(
    NotesAddRequested event,
    Emitter<NotesState> emit,
  ) async {
    try {
      await _notesRepository.addNote(event.text);
      final notes = await _notesRepository.fetchNotes();
      emit(
        NotesOperationSuccess(message: 'Note added successfully', notes: notes),
      );
    } catch (e) {
      emit(NotesError(message: e.toString()));
    }
  }

  Future<void> _onUpdateRequested(
    NotesUpdateRequested event,
    Emitter<NotesState> emit,
  ) async {
    try {
      await _notesRepository.updateNote(event.id, event.text);
      final notes = await _notesRepository.fetchNotes();
      emit(
        NotesOperationSuccess(
          message: 'Note updated successfully',
          notes: notes,
        ),
      );
    } catch (e) {
      emit(NotesError(message: e.toString()));
    }
  }

  Future<void> _onDeleteRequested(
    NotesDeleteRequested event,
    Emitter<NotesState> emit,
  ) async {
    try {
      await _notesRepository.deleteNote(event.id);
      final notes = await _notesRepository.fetchNotes();
      emit(
        NotesOperationSuccess(
          message: 'Note deleted successfully',
          notes: notes,
        ),
      );
    } catch (e) {
      emit(NotesError(message: e.toString()));
    }
  }
}
