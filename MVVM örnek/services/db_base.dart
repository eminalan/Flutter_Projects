import '../models/user.dart';

abstract class DBBase {
  Future<List<User>> getUsersList();
  Future<int> addUser(User user);
  Future<int> updateUser(User user);
  Future<int> deleteUser(int id);

}