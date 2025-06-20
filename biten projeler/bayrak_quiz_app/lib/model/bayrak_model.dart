// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class BayrakModel {
  int bayrak_id;
  String bayrak_ad;
  String bayrak_resim;

  BayrakModel(
    this.bayrak_id,
    this.bayrak_ad,
    this.bayrak_resim,
  );

  // Nesneyi Map'e dönüştürme (veritabanına kaydetmek için)
  Map<String, dynamic> toMap() {
    return {
      'bayrak_id': bayrak_id,
      'bayrak_ad': bayrak_ad,
      'bayrak_resim': bayrak_resim,
    };
  }

  // Map'ten nesne oluşturma (veritabanından okurken)
  factory BayrakModel.fromMap(Map<String, dynamic> map) {
    return BayrakModel(
      map['bayrak_id'] != null ? map['bayrak_id'] as int : 0,
      map['bayrak_ad'] != null ? map['bayrak_ad'] as String : '',
      map['bayrak_resim'] != null ? map['bayrak_resim'] as String : '',
    );
  }
  @override
  String toString() {
    return 'BayrakModel(bayrak_id: $bayrak_id, bayrak_ad: $bayrak_ad, bayrak_resim: $bayrak_resim)';
  }
}