// ignore_for_file: constant_identifier_names

import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/fake_auth_service.dart';
import 'package:flutter_lovers/services/firebase_auth_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<UserAuthService> currentUsers() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUsers();
    } else {
      return await _firebaseAuthService.currentUsers();
    }
  }

  @override
  Future<UserAuthService> singInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.singInAnonymously();
    } else {
      return await _firebaseAuthService.singInAnonymously();
    }
  }

  @override
  Future<bool> singOut() {
    if (appMode == AppMode.DEBUG) {
      return _fakeAuthenticationService.singOut();
    } else {
      return _firebaseAuthService.singOut();
    }
  }
}
