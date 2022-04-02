import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/data/model/note_model.dart';
import 'package:notepad/data/repository/note_repository.dart';

part 'note_edit_cubit.freezed.dart';

part 'note_edit_state.dart';

class NoteEditCubit extends Cubit<NoteEditState> {
  final NoteRepository _repository;

  NoteEditCubit(this._repository) : super(const NoteEditState.initial());

  Future<void> onUpdateNote(
      {required String id, required String title, required String content}) async {
    try {
      emit(const NoteEditState.loading());
      await _repository.updateNote(NoteModel(id: id, title: title, content: content));
      emit(const NoteEditState.success());
    } catch (e) {
      emit(NoteEditState.error(message: e.toString()));
    }
  }
}
