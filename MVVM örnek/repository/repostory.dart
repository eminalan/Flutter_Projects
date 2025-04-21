import '../models/user.dart';
import '../services/db_base.dart';
import '../services/mysql_db_helper.dart';
import '../services/oracle_db_helper.dart';
import '../services/sqlite_db_helper.dart';

class Repostory extends DBBase {
  //Singletion Start
  Repostory._privateSingle();
  static final Repostory _single = Repostory._privateSingle();
  factory Repostory() => _single;
  //Singletion End
  SQLiteDBHelper dbHelper = SQLiteDBHelper();
  MySQLDBHelper mySQLDBHelper =MySQLDBHelper();
  OracleDbHelper oracleDbHelper=OracleDbHelper();
  @override
  Future<int> addUser(User user) async {
    oracleDbHelper.addUser(user);
    mySQLDBHelper.addUser(user);
    return await dbHelper.addUser(user);
  }

  @override
  Future<int> deleteUser(int id) async {
    return await dbHelper.deleteUser(id);
  }

  @override
  Future<List<User>> getUsersList() async {
    return await dbHelper.getUsersList();
  }

  @override
  Future<int> updateUser(User user) async {
    return await dbHelper.updateUser(user);
  }
}
