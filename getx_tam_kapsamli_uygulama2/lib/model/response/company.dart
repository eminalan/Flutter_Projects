/// `Company` sınıfı, bir şirketin özelliklerini temsil eden bir veri sınıfıdır.
/// Bu sınıf, bir JSON verisinden oluşturulabilir (`fromJson`) ve JSON verisine
/// dönüştürülebilir (`toJson`).  Genellikle bir API'den gelen verileri
/// modellemek için kullanılır.
class Company {
  /// Şirketin adı. String türünde, null olabilir (`?`).
  String? name;

  /// Şirketin sloganı veya kısa tanımı. String türünde, null olabilir.
  String? catchPhrase;

  /// Şirketin faaliyet alanını veya iş tanımını özetleyen bir ifade.
  /// String türünde, null olabilir.
  String? bs;

  /// `Company` sınıfının yapıcı metodu.  Tüm parametreler isteğe bağlıdır
  /// ve null olabilir.
  Company({this.name, this.catchPhrase, this.bs});

  /// JSON verisinden `Company` nesnesi oluşturur.  JSON verisinin yapısı,
  /// sınıfın alanlarına karşılık gelmelidir.  `json` parametresi,
  /// bir `Map<String, dynamic>` türünde olmalıdır.
  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  /// `Company` nesnesini JSON verisine dönüştürür.  Bu, verinin
  /// bir API'ye gönderilmesi veya başka bir sisteme aktarılması için
  /// kullanılabilir.  Metot, bir `Map<String, dynamic>` türünde bir
  /// JSON verisi döndürür.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
