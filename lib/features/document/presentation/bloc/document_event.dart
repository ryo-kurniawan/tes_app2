part of 'document_bloc.dart';

@freezed
class DocumentEvent with _$DocumentEvent {
  const factory DocumentEvent.started() = _Started;
  const factory DocumentEvent.fetch() = _Fetch;
}
