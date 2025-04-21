import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firibaseAuth = FirebaseAuth.instance;

  @override
  Future<UserAuthService> currentUsers() async {
    try {
      User? user = _firibaseAuth.currentUser;
      return _userFormFirebase(user);
    } catch (e) {
      debugPrint("HATA CURRENT USER: $e");
      return UserAuthService(UserID: "null");
    }
  }

  UserAuthService _userFormFirebase(User? user) {
    if (user == null) {
      return UserAuthService(UserID: "null");
    } else {
      return UserAuthService(UserID: user.uid);
    }
  }

  @override
  Future<UserAuthService> singInAnonymously() async{
    try {
     UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
     return _userFormFirebase(sonuc.user);
    } catch (e) {
      debugPrint("ANONİM GİRİŞ HATA: $e");
      return UserAuthService(UserID: "null");
    } 
  }

  @override
  Future<bool> singOut() async {
    try {
      await _firibaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("HATA SING OUT: $e");
      return false;
    }
  }
}
