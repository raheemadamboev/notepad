part of 'note_list_cubit.dart';

@freezed
class NoteListState with _$NoteListState {
  const factory NoteListState.loading() = _Loading;
  const factory NoteListState.error({required String message}) = _Error;
  const factory NoteListState.success(List<NoteModel> notes) = _Success;
}
