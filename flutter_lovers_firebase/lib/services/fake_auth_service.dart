import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "123456789";
  @override
  Future<UserAuthService> currentUsers() async {
    return await Future.value(UserAuthService(UserID: userID)); 
  }

  @override
  Future<UserAuthService> singInAnonymously() {
    return Future.delayed(
      Duration(seconds: 2),
      () => UserAuthService(UserID: userID),
    );
  }

  @override
  Future<bool> singOut() async {
    return Future.value(true);
  }
}
