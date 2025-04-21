import 'package:flutter_lovers/model/user_model.dart';

abstract class AuthBase {
  Future<UserAuthService> currentUsers();
  Future<UserAuthService> singInAnonymously();
  Future<bool> singOut();
}
