import '../models/user.dart';
import 'db_base.dart';

class OracleDbHelper extends DBBase {
  //Singleton Start
  OracleDbHelper._privateSingle();
  static final _single=OracleDbHelper._privateSingle();
  factory OracleDbHelper ()=>_single; 
  //Singleton End
  @override
  Future<int> addUser(User user) async {
    print("oracle add user:${user.name}");
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
