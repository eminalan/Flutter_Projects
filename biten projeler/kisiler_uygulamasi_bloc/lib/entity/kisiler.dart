// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class Kisiler {
  int kisi_id;
  String kisi_ad;
  String kisi_tel;
  Kisiler({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kisi_id': kisi_id,
      'kisi_ad': kisi_ad,
      'kisi_tel': kisi_tel,
    };
  }

  factory Kisiler.fromMap(Map<String, dynamic> map) {
    return Kisiler(
      kisi_id: map['kisi_id'] as int,
      kisi_ad: map['kisi_ad'] as String,
      kisi_tel: map['kisi_tel'] as String,
    );
  }
}
