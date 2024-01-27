import 'package:dartz/dartz.dart';
import 'package:gosign/core/constants/variables.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:gosign/features/login/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String username, String password) async {
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/auth/login'),
        headers: {'User-Agent': Variables.userAgent},
        body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response =
        await http.post(Uri.parse('${Variables.baseUrl}/api/logout'), headers: {
      'Authorization': 'Bearer ${authData.accessToken}',
    });
    if (response.statusCode == 200) {
      return right(response.body);
    } else {
      return left(response.body);
    }
  }
}
