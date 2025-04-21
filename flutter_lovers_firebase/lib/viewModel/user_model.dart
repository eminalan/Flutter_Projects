import 'package:flutter/material.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/repository/user_repository.dart';
import 'package:flutter_lovers/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserModel extends ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;

  UserRepository _userRepository = locator<UserRepository>();
  late UserAuthService _user;
  UserAuthService get user => _user;

  get state => _state;

  set state(value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUsers();
  }

  @override
  Future<UserAuthService> currentUsers() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUsers();
      return _user;
    } catch (e) {
      debugPrint("View Modeldeki CURRENT USER hata :$e");
      return UserAuthService(UserID: "null");
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserAuthService> singInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.singInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("View Modeldeki singIn Anonymously hata :$e");
      return UserAuthService(UserID: "null");
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> singOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.singOut();
      return sonuc;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:$e");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
