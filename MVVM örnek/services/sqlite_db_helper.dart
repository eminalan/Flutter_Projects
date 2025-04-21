import '../models/user.dart';
import '../my_extensions.dart';
import 'db_base.dart';

class SQLiteDBHelper extends DBBase {
  //Singleton Start
  SQLiteDBHelper._privateSingle();
  static final SQLiteDBHelper _single=SQLiteDBHelper._privateSingle();
  factory SQLiteDBHelper ()=>_single;
  //Singleton End

  List<User> userList=[];
  @override
  Future<int> addUser(User user)async {
     userList.add(user);
    return 1;
  }

  @override
  Future<int> deleteUser(int id)async {
   bool isRemove= userList.myRemoveWhere((element) =>element.id==id );
   return isRemove==true?1:-1;
  }

  @override
  Future<List<User>> getUsersList()async {
    return await userList;
  }

  @override
  Future<int> updateUser(User user)async {
    int result =-1;
    for (var element in userList) {
      if (element.id==user.id) {
        element.name=user.name;
        result =user.id;
      }
    }
    return result;
  }
  
}