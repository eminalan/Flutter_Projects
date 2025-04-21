// ignore_for_file: must_be_immutable, unused_import, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/common_widget/social_login_button.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/firebase_auth_service.dart';
import 'package:flutter_lovers/viewModel/user_model.dart';
import 'package:provider/provider.dart';

class SingInPage extends StatelessWidget {
  SingInPage({super.key});

  void _misafirGirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    UserAuthService _user = await _userModel.singInAnonymously();
    context.read<UserModel>();
    debugPrint("Oturum Açan Misafir Kullanıcı ID: ${_user.UserID}");
  }

  double bosluk = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Canlı Sohbet'), elevation: 0),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: bosluk + 50),
            SocialLoginButton(
              buttonColor: Colors.white,
              textColor: Colors.black,
              buttonText: "Google İle Oturum Aç",
              buttonIcon: Image.asset(
                "images/google.png",
                width: 30,
                height: 30,
              ),
              onPressed: () {},
            ),
            SizedBox(height: bosluk),
            SocialLoginButton(
              buttonColor: Color(0xFF334d92),
              textColor: Colors.white,
              buttonText: "Facebook İle Giriş Yap",
              buttonIcon: Image.asset(
                "images/facebook.png",
                width: 30,
                height: 30,
              ),
              onPressed: () {},
            ),

            SizedBox(height: bosluk),
            SocialLoginButton(
              buttonColor: Colors.teal,
              buttonText: "Email ve Şifre ile  Giriş Yap",
              buttonIcon: Icon(Icons.email, color: Colors.white, size: 30),
              onPressed: () {},
            ),
            SizedBox(height: bosluk),
            SocialLoginButton(
              buttonColor: Colors.orange,
              buttonText: "Misafir Girişi",
              buttonIcon: Icon(Icons.mail, color: Colors.white, size: 30),
              onPressed: () => _misafirGirisi(context),
            ),
          ],
        ),
      ),
    );
  }
}
