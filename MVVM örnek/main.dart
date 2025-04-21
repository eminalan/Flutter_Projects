import 'repository/repostory.dart';
import 'models/user.dart';
import 'services/db_base.dart';
import 'services/mysql_db_helper.dart';

void main(List<String> args) async {
  Repostory repostory = Repostory();
  //Singleton Control
  DBBase m1=MySQLDBHelper();
  DBBase m2=MySQLDBHelper();
  print("isSame-1:${identical(m1, m2)}");
  print("isSame-2:${m1==m2}");
  //Add User
  print(await repostory.addUser(User(name: "Osman", id: 1)));
  print(await repostory.addUser(User(name: "Ahmet", id: 2)));
  //UserList
  List<User> userList = await repostory.getUsersList();
  //Print userList
  print("UserList: ${userList.map((e) => e.name)}");
  //Update User
  print(await repostory.updateUser(User(name: "Selim", id: 1)));
  //Print userList
  print("UserList: ${userList.map((e) => e.name)}");
  //Dellete User
  print(await repostory.deleteUser(1));
  //Print userList
  print("UserList: ${userList.map((e) => e.name)}");
}
