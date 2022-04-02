import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel(
      {String? id,
      required String title,
      required String content,
      DateTime? timestamp}) = _NoteModel;
}
