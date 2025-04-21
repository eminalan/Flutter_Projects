// ignore_for_file: non_constant_identifier_names

class ModelKisi {
  int? id_kisi;
  String ad;
  String soyad;

  int yas;
  


  ModelKisi({
    this.id_kisi,
    required this.ad,
    required this.soyad,
    required this.yas ,
    
  });

  
 factory ModelKisi.fromMap(Map<String, dynamic> map) {
    return ModelKisi(
      id_kisi: map['id_kisi']??0,
      ad: map['ad'] ,
      soyad: map['soyad'] ,
      yas: map['yas'],
    );
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_kisi'] = id_kisi;
    data['ad'] = ad;
    data['soyad'] = soyad;
    data['yas'] = yas;
    return data;
  }
}
  
