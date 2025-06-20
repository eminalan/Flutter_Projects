import 'package:dio/dio.dart';
import 'package:flutter_http_kullanimi/model/NutritionModel.dart';

class NutritionService {
  final Dio _dio = Dio();

  final String _baseUrl =
      'https://api.collectapi.com/nutrition/getNutrition?name=';

  // ❗️ Sadece API key yazılmalı. "apikey " eklemeyeceksin.
  final String _apiKey = '0cDCke0TfiIHWZFozsAKnB:4aALi7ljU9pPMLc2v5rQvh';

  Future<List<NutritionModel>> getNutrition(String foodName) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$foodName',
        options: Options(
          headers: {
            'authorization': 'apikey $_apiKey', // Doğru kullanım!
            'content-type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> result = response.data['result'];
        return result.map((json) => NutritionModel.fromJson(json)).toList();
      } else {
        throw Exception('API Hatası: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Veri alınamadı: $e');
    }
  }
}