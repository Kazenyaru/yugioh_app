import 'dart:async';

import 'package:dio/dio.dart';

import '../../model/yugioh_card_info.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://db.ygoprodeck.com/api/v7',
      responseType: ResponseType.plain,
    ),
  );

  static Future<YuGiOhCardInfo> getYuGiOhCardInfo({
    int numCount,
    int offsetCount,
  }) async {
    try {
      Response<String> _response = await _dio.get<String>(
        '/cardinfo.php',
        queryParameters: <String, dynamic>{
          'num': numCount,
          'offset': offsetCount,
        },
      );
      return YuGiOhCardInfo.fromJson(_response.data);
    } catch (e) {
      return null;
    }
  }
}
