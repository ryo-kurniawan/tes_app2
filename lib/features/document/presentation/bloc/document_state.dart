part of 'document_bloc.dart';

@freezed
class DocumentState with _$DocumentState {
  const factory DocumentState.initial() = _Initial;
  const factory DocumentState.loading() = _Loading;

  const factory DocumentState.success(List<Datum> datum) = _Success;

  const factory DocumentState.error(String message) = _Error;
  const factory DocumentState.connection() = _Connection;
}
