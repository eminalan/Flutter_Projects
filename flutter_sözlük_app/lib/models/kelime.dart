class Kelime {
  int? id;
  String tr;
  String en;

  Kelime({this.id, required this.tr, required this.en});

  factory Kelime.fromMap(Map<String, dynamic> map) {
    return Kelime(id: map['id'] ?? 0, tr: map['tr'], en: map['en']);
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tr'] = tr;
    data['en'] = en;
    return data;
  }
}
