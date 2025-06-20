import 'package:dio/dio.dart';
import 'package:flutter_http_kullanimi/model/hava_model.dart';

class WeatherService {
  final Dio _dio = Dio();

  final String _baseUrl =
      'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=';

  final String _apiKey =
      'apikey 0cDCke0TfiIHWZFozsAKnB:4aALi7ljU9pPMLc2v5rQvh'; // CollectAPI Anahtarınızı buraya girin

  Future<List<WeatherModel>> getWeather(String city) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$city',
        options: Options(
          headers: {
            'authorization': 'apikey $_apiKey',
            'content-type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> result = response.data['result'];
        return result.map((json) => WeatherModel.fromJson(json)).toList();
      } else {
        throw Exception('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Veri alınamadı: $e');
    }
  }
}
