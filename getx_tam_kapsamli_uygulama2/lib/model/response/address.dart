import 'package:getx_tam_kapsamli_uygulama/model/response/geo.dart';

/// `Address` sınıfı, bir adresin özelliklerini temsil eder.  Bu sınıf, bir JSON
/// verisinden oluşturulabilir (`fromJson`) ve JSON verisine dönüştürülebilir (`toJson`).
///
/// Adres bilgileri, sokak adı (`street`), daire numarası (`suite`), şehir (`city`),
/// posta kodu (`zipcode`) ve coğrafi konum (`geo`) olmak üzere beş alandan oluşur.
/// `geo` alanı, `Geo` sınıfı kullanılarak temsil edilir.
class Address {
  /// Sokak adı.  String türünde, null olabilir.
  String? street;

  /// Daire numarası veya benzeri bir ek bilgi. String türünde, null olabilir.
  String? suite;

  /// Şehir adı. String türünde, null olabilir.
  String? city;

  /// Posta kodu. String türünde, null olabilir.
  String? zipcode;

  /// Coğrafi konum bilgisi. `Geo` sınıfının bir örneği, null olabilir.
  Geo? geo;

  /// `Address` sınıfının yapıcı metodu.  Tüm alanlar isteğe bağlıdır (`?`).
  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  /// JSON verisinden `Address` nesnesi oluşturur.  JSON verisinin yapısı,
  /// yukarıdaki alanlara karşılık gelir.  `geo` alanı, `Geo.fromJson()` kullanılarak
  /// oluşturulur.  Eğer `json['geo']` null ise, `geo` alanı null olarak kalır.
  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  /// `Address` nesnesini JSON verisine dönüştürür.  Bu metot, verinin
  /// başka sistemlere veya API'lere gönderilmesi için kullanılabilir.
  /// Eğer `geo` alanı null değilse, `geo.toJson()` kullanılarak JSON verisine
  /// dönüştürülür.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}
