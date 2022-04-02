import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/data/model/note_model.dart';
import 'package:notepad/data/repository/note_repository.dart';

part 'note_add_cubit.freezed.dart';

part 'note_add_state.dart';

class NoteAddCubit extends Cubit<NoteAddState> {
  final NoteRepository _repository;

  NoteAddCubit(this._repository) : super(const NoteAddState.initial());

  Future<void> onInsertNote({required String title, required String content}) async {
    try {
      emit(const NoteAddState.loading());
      await _repository.insertNote(NoteModel(title: title, content: content));
      emit(const NoteAddState.success());
    } catch (e) {
      emit(NoteAddState.error(message: e.toString()));
    }
  }
}
