// ignore_for_file: non_constant_identifier_names

class Yonetmenler {
  int? yonetmen_id;
  String? yonetmen_ad;

  Yonetmenler(this.yonetmen_id, this.yonetmen_ad);

  factory Yonetmenler.fromMap(Map<String, dynamic> map) {
    return Yonetmenler(
      map['yonetmen_id'] != null ? map['yonetmen_id'] as int : null,
      map['yonetmen_ad'] != null ? map['yonetmen_ad'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {'yonetmen_id': yonetmen_id, 'yonetmen_ad': yonetmen_ad};
  }

  @override
  String toString() {
    return 'Yonetmenler{yonetmen_id: $yonetmen_id, yonetmen_ad: $yonetmen_ad}';
  }
}
