// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:getx_tam_kapsamli_uygulama/base/base_service.dart';

/// `NetworkManager`, Dio kütüphanesini kullanarak ağ isteklerini (HTTP GET
/// istekleri) yöneten bir sınıftır. `BaseService` sınıfından türetilmiştir ve
/// GetX'in durum yönetimi özelliklerini kullanır.  `interceptors` özelliği,
/// isteklere ve yanıtları işlemek için kullanılır.
class NetworkManager extends BaseService {
  /// Dio nesnesi. Ağ isteklerini gerçekleştirmek için kullanılır.
  final Dio _dio = Dio();

  /// Dio'nun interceptor'ları.  İstekler ve yanıtlar üzerinde işlem yapmak için
  /// kullanılır.  Bu örnekte, her istekte "Authorizantion" başlığını ekler ve
  /// yanıt ve hata durumlarını konsola yazdırır.
  final InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
    onRequest: (options, handler) {
      /// Her istekten önce çalışır.  Bu örnekte, "Authorizantion" başlığını
      /// ekler.  Bu başlık, genellikle API yetkilendirmesi için kullanılır.
      options.headers.addAll({"Authorizantion": "1234"});
      handler.next(options);
    },
    onResponse: (response, handler) {
      /// Her başarılı yanıttan sonra çalışır.  Bu örnekte, "response Geldi"
      /// mesajını konsola yazdırır.  Genellikle debug amaçlı kullanılır.
      print("response Geldi");
      handler.next(response);
    },
    onError: (error, handler) {
      /// Her hata durumunda çalışır.  Bu örnekte, hatayı konsola yazdırır.
      /// Daha gelişmiş hata yönetimi için burası genişletilebilir.
      handler.next(error);
    },
  );

  /// `onInit()` metodu, GetX controller'ı başlatıldığında çağrılır.  Bu metotta,
  /// `interceptorsWrapper` Dio nesnesine eklenir.
  @override
  void onInit() {
    super.onInit();
    _dio.interceptors.add(interceptorsWrapper);
    print("network manager oluştu ve intersepters wrapped eklendi!!!");
  }

  /// `get()` metodu,  HTTP GET isteği yapar.  `url` parametresi, istek yapılacak
  /// URL'yi belirtir.  `headres` parametresi, isteğe eklenebilecek başlıkları
  /// içerir.  Metot, `Future<Response>` türünde bir değer döndürür.
  Future<Response> get(String url, {Map<String, dynamic>? headres}) async {
    final Response response = await _dio.get(
      url,
      options: Options(headers: headres),
    );
    return response;
  }
}
