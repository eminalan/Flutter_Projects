import '../models/user.dart';
import 'db_base.dart';

class MySQLDBHelper extends DBBase {
  //Singleton Start
  MySQLDBHelper._privateSingle();
  static final MySQLDBHelper _single=MySQLDBHelper._privateSingle();
  factory MySQLDBHelper ()=>_single;
  //Singleton End
  @override
  Future<int> addUser(User user)async {
    print("Mysql Add User:${user.name}");
    return 1;
  }

  @override
  Future<int> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsersList() {
    // TODO: implement getUsersList
    throw UnimplementedError();
  }

  @override
  Future<int> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
}