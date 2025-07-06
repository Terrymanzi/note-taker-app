import 'package:equatable/equatable.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class NotesLoadRequested extends NotesEvent {}

class NotesAddRequested extends NotesEvent {
  final String text;

  const NotesAddRequested({required this.text});

  @override
  List<Object> get props => [text];
}

class NotesUpdateRequested extends NotesEvent {
  final String id;
  final String text;

  const NotesUpdateRequested({required this.id, required this.text});

  @override
  List<Object> get props => [id, text];
}

class NotesDeleteRequested extends NotesEvent {
  final String id;

  const NotesDeleteRequested({required this.id});

  @override
  List<Object> get props => [id];
}
