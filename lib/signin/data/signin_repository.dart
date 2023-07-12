import 'package:dio/dio.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/api/api_single_dio.dart';
import 'package:helpme/core/api/models/api_state_model.dart';
import 'package:helpme/signup/data/models/signup_model.dart';

class SignInRepository {
  static Future<ApiStateModel<SignUpModel?>> signIn({
    required String pinCode,
    required String idToken,
    int? age
  }) async {
    final data = {
      'oauthIdToken': idToken,
      'pinCode': pinCode,
    };
    final response = await SingleDio().dioInstance.post(
      '$apiEndpoint/user/sign-in',
      data: data,
      options: Options(contentType: Headers.jsonContentType),
    );

    final body = ApiStateModel<SignUpModel?>.fromJson(
      response.data,
      (data) => data != null
        ? SignUpModel.fromJson(data as Map<String, dynamic>)
        : null
    );

    return body;
  }
}
