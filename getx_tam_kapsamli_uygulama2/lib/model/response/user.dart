import 'package:getx_tam_kapsamli_uygulama/model/response/address.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/company.dart';

/// `User` sınıfı, bir kullanıcının özelliklerini temsil eden bir veri modelidir.
/// Bu sınıf, bir JSON verisinden oluşturulabilir (`fromJson`) ve JSON verisine
/// dönüştürülebilir (`toJson`).  Genellikle bir API'den gelen kullanıcı verilerini
/// temsil etmek için kullanılır.
class User {
  /// Kullanıcının benzersiz kimlik numarası.  `int` türünde, null olabilir (`?`).
  int? id;

  /// Kullanıcının adı. `String` türünde, null olabilir.
  String? name;

  /// Kullanıcının kullanıcı adı. `String` türünde, null olabilir.
  String? username;

  /// Kullanıcının e-posta adresi. `String` türünde, null olabilir.
  String? email;

  /// Kullanıcının adres bilgileri. `Address` sınıfının bir örneği, null olabilir.
  Address? address;

  /// Kullanıcının telefon numarası. `String` türünde, null olabilir.
  String? phone;

  /// Kullanıcının web sitesi adresi. `String` türünde, null olabilir.
  String? website;

  /// Kullanıcının çalıştığı şirket bilgileri. `Company` sınıfının bir örneği, null olabilir.
  Company? company;

  /// `User` sınıfının yapıcı metodu. Tüm parametreler isteğe bağlıdır ve null olabilir.
  User({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});

  /// JSON verisinden `User` nesnesi oluşturur.  JSON verisinin yapısı,
  /// sınıfın alanlarına karşılık gelmelidir.  `json` parametresi,
  /// bir `Map<String, dynamic>` türünde olmalıdır.  `address` ve `company`
  /// alanları, ilgili sınıfların `fromJson` metodları kullanılarak oluşturulur.
  /// Eğer `json['address']` veya `json['company']` null ise, ilgili alanlar null olarak kalır.
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  /// `User` nesnesini JSON verisine dönüştürür.  Bu, verinin bir API'ye
  /// gönderilmesi veya başka bir sisteme aktarılması için kullanılabilir.
  /// Metot, bir `Map<String, dynamic>` türünde bir JSON verisi döndürür.
  /// `address` ve `company` alanları, ilgili sınıfların `toJson` metodları
  /// kullanılarak JSON verisine dönüştürülür.  Eğer `address` veya `company`
  /// null ise, ilgili alanlar JSON verisine dahil edilmez.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
