import 'package:flutter/material.dart';
import 'package:flutter_http_kullanimi/model/NutritionModel.dart';
import 'package:flutter_http_kullanimi/services/dio/nutrition_service.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final TextEditingController _controller = TextEditingController();
  final NutritionService _nutritionService = NutritionService();

  List<NutritionModel> nutritionList = [];
  bool isLoading = false;
  String error = '';

  void _fetchNutrition() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final list = await _nutritionService.getNutrition(_controller.text);
      setState(() {
        nutritionList = list;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        nutritionList = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildNutritionCard(NutritionModel data) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(data.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kalori: ${data.calorie}"),
            Text("Karbonhidrat: ${data.carbohydrate}"),
            Text("Protein: ${data.protein}"),
            Text("Yağ: ${data.fat}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Besin Bilgisi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Besin gir (örn: Elma)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _fetchNutrition,
                  child: const Text('Sorgula'),
                )
              ],
            ),
          ),
          if (isLoading) const CircularProgressIndicator(),
          if (error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(error, style: const TextStyle(color: Colors.red)),
            ),
          if (nutritionList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: nutritionList.length,
                itemBuilder: (context, index) {
                  return _buildNutritionCard(nutritionList[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}