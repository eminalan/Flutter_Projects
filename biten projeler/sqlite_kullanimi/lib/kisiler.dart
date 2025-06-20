// ignore_for_file: non_constant_identifier_names

class Kisiler {
  int? kisi_id; // null olabilir çünkü yeni kayıtta id olmayabilir
  String kisi_ad;
  int kisi_yas;

  Kisiler({
    this.kisi_id,
    required this.kisi_ad,
    required this.kisi_yas,
  });

  // Map'e dönüştür (veritabanına eklerken kullanılır)
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'kisi_ad': kisi_ad,
      'kisi_yas': kisi_yas,
    };

    if (kisi_id != null) {
      map['kisi_id'] = kisi_id;
    }

    return map;
  }

  // Map'ten nesneye çevir (veritabanından okurken kullanılır)
  factory Kisiler.fromMap(Map<String, dynamic> map) {
    return Kisiler(
      kisi_id: map['kisi_id'] != null ? map['kisi_id'] as int : null,
      kisi_ad: map['kisi_ad'] ?? '',
      kisi_yas: map['kisi_yas'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Kisiler{id: $kisi_id, ad: $kisi_ad, yas: $kisi_yas}';
  }
}