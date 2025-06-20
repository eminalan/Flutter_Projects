class NutritionModel {
  final String name;
  final String calorie;
  final String carbohydrate;
  final String protein;
  final String fat;

  NutritionModel({
    required this.name,
    required this.calorie,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      name: json['name'] ?? 'Bilinmiyor',
      calorie: json['calorie'] ?? '-',
      carbohydrate: json['carbohydrate'] ?? '-',
      protein: json['protein'] ?? '-',
      fat: json['fat'] ?? '-',
    );
  }
  
}