/// `Geo` sınıfı, coğrafi konum bilgisini temsil eder.  Bu sınıf, enlem (`lat`) ve
/// boylam (`lng`) değerlerini içerir.  JSON verisinden oluşturulabilir (`fromJson`)
/// ve JSON verisine dönüştürülebilir (`toJson`). Genellikle bir API yanıtında
/// konum bilgisini modellemek için kullanılır.
class Geo {
  /// Enlem değeri. String türünde, null olabilir (`?`).
  String? lat;

  /// Boylam değeri. String türünde, null olabilir.
  String? lng;

  /// `Geo` sınıfının yapıcı metodu.  `lat` ve `lng` parametreleri isteğe bağlıdır
  /// ve null olabilir.
  Geo({this.lat, this.lng});

  /// JSON verisinden `Geo` nesnesi oluşturur. JSON verisinin yapısı, sınıfın
  /// alanlarına karşılık gelmelidir.  `json` parametresi,
  /// bir `Map<String, dynamic>` türünde olmalıdır.
  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  /// `Geo` nesnesini JSON verisine dönüştürür.  Bu, verinin bir API'ye
  /// gönderilmesi veya başka bir sisteme aktarılması için kullanılabilir.
  /// Metot, bir `Map<String, dynamic>` türünde bir JSON verisi döndürür.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
