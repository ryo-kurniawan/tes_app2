// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gosign/features/document/data/datasources/document_remote_datasource.dart';
import 'package:gosign/features/document/data/models/response/document_response_model.dart';

part 'document_bloc.freezed.dart';
part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentRemoteDatasource _documentRemoteDatasource;
  List<Datum> documents = [];
  DocumentBloc(this._documentRemoteDatasource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const DocumentState.loading());
      final response = await _documentRemoteDatasource.getDocuments();
      response.fold(
        (l) => emit(
          DocumentState.error(l),
        ),
        (r) {
          documents = r.data;

          emit(DocumentState.success(r.data));
        },
      );
    });
  }
}
