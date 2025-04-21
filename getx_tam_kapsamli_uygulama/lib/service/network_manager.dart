// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:getx_tam_kapsamli_uygulama/base/base_service.dart';

class NetworkManager extends BaseService {
  final Dio _dio = Dio();
  final InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers.addAll({"Authorizantion": "1234"});
      handler.next(options);
    },
    onResponse: (response, handler) {
      print("response Geldi");
      handler.next(response);
    },
    onError: (error, handler) {
      handler.next(error);
    },
  );

  @override
  void onInit() {
    super.onInit();
    _dio.interceptors.add(interceptorsWrapper);
    print("network manager oluştu ve intersepters wrapped eklendi!!!");
  }

  Future<Response> get(String url, {Map<String, dynamic>? headres}) async {
    final Response response = await _dio.get(
      url,
      options: Options(headers: headres),
    );
    return response;
  }
}
