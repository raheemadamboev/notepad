part of 'note_add_cubit.dart';

@freezed
class NoteAddState with _$NoteAddState {
  const factory NoteAddState.initial() = _Initial;

  const factory NoteAddState.loading() = _Loading;

  const factory NoteAddState.error({required String message}) = _Error;

  const factory NoteAddState.success() = _Success;
}
