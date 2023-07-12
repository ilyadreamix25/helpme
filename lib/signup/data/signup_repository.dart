import 'package:dio/dio.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/api/api_single_dio.dart';
import 'package:helpme/core/api/models/api_state_model.dart';
import 'package:helpme/signup/data/models/signup_model.dart';
import 'package:helpme/signup/data/models/signup_nickname_model.dart';

class SignUpRepository {
  static Future<ApiStateModel<SignUpNicknameModel?>> checkNicknameAvailability(String nickname) async {
    final response = await SingleDio().dioInstance.post(
      '$apiEndpoint/user/check-nickname-availability',
      options: Options(contentType: Headers.jsonContentType),
      queryParameters: {'nickname': nickname}
    );

    final body = ApiStateModel<SignUpNicknameModel?>.fromJson(
      response.data,
      (data) => data != null
        ? SignUpNicknameModel.fromJson(data as Map<String, dynamic>)
        : null
    );

    return body;
  }

  static Future<ApiStateModel<SignUpModel?>> signUp({
    required String pinCode,
    required String nickname,
    required String idToken,
    int? age
  }) async {
    final data = {
      'nickname': nickname,
      'oauthIdToken': idToken,
      'pinCode': pinCode,
      'age': age,
    };
    final response = await SingleDio().dioInstance.post(
      '$apiEndpoint/user/sign-up',
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
