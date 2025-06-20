// ignore_for_file: non_constant_identifier_names

class Kategoriler {
  int? kategori_id;
  String? kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromMap(Map<String, dynamic> map) {
    return Kategoriler(
      map['kategori_id'] != null ? map['kategori_id'] as int : null,
      map['kategori_ad'] != null ? map['kategori_ad'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kategori_id': kategori_id,
      'kategori_ad': kategori_ad,
    };
  }
  @override
  String toString() {
    return 'Kategoriler{kategori_id: $kategori_id, kategori_ad: $kategori_ad}';
  }
}