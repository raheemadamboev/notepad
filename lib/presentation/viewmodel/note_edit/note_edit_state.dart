part of 'note_edit_cubit.dart';

@freezed
class NoteEditState with _$NoteEditState {
  const factory NoteEditState.initial() = _Initial;

  const factory NoteEditState.loading() = _Loading;

  const factory NoteEditState.error({required String message}) = _Error;

  const factory NoteEditState.success() = _Success;
}
