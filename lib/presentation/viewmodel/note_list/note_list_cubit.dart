import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/data/repository/note_repository.dart';

import '../../../data/model/note_model.dart';

part 'note_list_cubit.freezed.dart';

part 'note_list_state.dart';

class NoteListCubit extends Cubit<NoteListState> {
  final NoteRepository _repository;

  NoteListCubit(this._repository) : super(const NoteListState.loading()) {
    onGetNotes();
  }

  Future<void> onGetNotes() async {
    try {
      emit(const NoteListState.loading());
      final notes = await _repository.getNotes();
      emit(NoteListState.success(notes));
    } catch (e) {
      emit(NoteListState.error(message: e.toString()));
    }
  }
}
