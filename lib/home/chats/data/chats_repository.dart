import 'dart:io';

import 'package:dio/dio.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/api/api_single_dio.dart';
import 'package:helpme/core/api/models/api_state_model.dart';
import 'package:helpme/core/auth/auth_service.dart';
import 'package:helpme/core/objects/chat.dart';

class ChatsRepository {
  static Future<ApiStateModel<List<Chat>?>> getUserChats({
    int offset = 0,
    int size = 50,
  }) async {
    final auth = await AuthService.getAuth();
    final response = await SingleDio().dioInstance.get(
      '$apiEndpoint/chat/list/joined-me?offset=$offset&size=$size',
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${auth.authToken}'
        },
      ),
    );

    final body = ApiStateModel<List<Chat>?>.fromJson(
      response.data,
      (data) {
        if (data != null) {
          final List<dynamic> chatListJson = data as List<dynamic>;
          final List<Chat> chatList = chatListJson
            .map((chatJson) => Chat.fromJson(chatJson))
            .toList();
          return chatList;
        }
        return null;
      },
    );

    return body;
  }
}
