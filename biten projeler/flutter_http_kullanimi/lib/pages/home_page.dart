import 'package:flutter/material.dart';
import 'package:flutter_http_kullanimi/model/hava_model.dart';
import 'package:flutter_http_kullanimi/services/dio/hava_servis.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  final WeatherService _weatherService = WeatherService();

  List<WeatherModel> weatherList = [];
  bool isLoading = false;
  String error = '';

  void _fetchWeather() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final list = await _weatherService.getWeather(_cityController.text);
      setState(() {
        weatherList = list;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        weatherList = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hava Durumu')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,

                    decoration: const InputDecoration(
                      labelText: 'Şehir girin (örn: Istanbul)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _fetchWeather,
                  child: const Text('Getir'),
                ),
              ],
            ),
          ),
          if (isLoading) const CircularProgressIndicator(),
          if (error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(error, style: const TextStyle(color: Colors.red)),
            ),
          if (weatherList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: weatherList.length,
                itemBuilder: (context, index) {
                  return _buildWeatherCard(weatherList[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(WeatherModel weather) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 3,
          child: ListTile(
            leading: Image.network(weather.icon!, width: 40),
            title: Text(weather.day!),
            subtitle: Text('${weather.description} | ${weather.degree}°'),
            trailing: Text(weather.status!),
          ),
        ),
      ],
    );
  }
}
