import '../../domain/entities/rehper.dart';

// DB ile iletişim kuran, veriyi alıp Entity'ye dönüştüren model
class UserModel extends Rehper {
  UserModel({super.id, required super.name, required super.phone});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'phone': phone,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}