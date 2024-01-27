import 'package:dartz/dartz.dart';
import 'package:gosign/core/constants/variables.dart';
import 'package:gosign/features/document/data/models/response/document_response_model.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class DocumentRemoteDatasource {
  Future<Either<String, DocumentResponseModel>> getDocuments() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
        Uri.parse(
            '${Variables.baseUrl}/api/v1/getDocumentByAssign/${authData.nik}'),
        headers: {
          'Authorization': 'Bearer ${authData.accessToken}',
          'User-Agent': Variables.userAgent
        });
    if (response.statusCode == 200) {
      return right(DocumentResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}
