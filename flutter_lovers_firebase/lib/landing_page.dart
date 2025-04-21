// ignore_for_file: unnecessary_null_comparison, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_lovers/home_page.dart';
import 'package:flutter_lovers/sing_in_page.dart';
import 'package:flutter_lovers/viewModel/user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SingInPage();
      } else {
        return HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
