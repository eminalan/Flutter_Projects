// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, must_be_immutable, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewModel/user_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final UserAuthService? user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,

        title: Text("Ana Sayfa", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () => _cikisYap(context),
            icon: Icon(Icons.exit_to_app, size: 35),
          ),
        ],
      ),
      body: Center(child: Text("Hoşgeldiniz ${user?.UserID}")),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.singOut();
    return sonuc;
  }
}
