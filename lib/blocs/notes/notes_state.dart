import 'package:equatable/equatable.dart';
import '../../models/note.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;

  const NotesLoaded({required this.notes});

  @override
  List<Object> get props => [notes];
}

class NotesError extends NotesState {
  final String message;

  const NotesError({required this.message});

  @override
  List<Object> get props => [message];
}

class NotesOperationSuccess extends NotesState {
  final String message;
  final List<Note> notes;

  const NotesOperationSuccess({required this.message, required this.notes});

  @override
  List<Object> get props => [message, notes];
}
