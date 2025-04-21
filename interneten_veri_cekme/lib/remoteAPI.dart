import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interneten_veri_cekme/model/user_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<UserModel>> _getUserList() async {
    try {
      var respose =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      List<UserModel> _useList = [];
      if (respose.statusCode == 200) {
        _useList =
            (respose.data.map<UserModel>((e) => UserModel.fromMap(e)).toList());
      }
      return _useList;
    } on DioException catch (e) {
      return Future.error(e.message!);
    }
  }

  late final Future<List<UserModel>> _userList;
  @override
  void initState() {
    super.initState();
    _userList = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote API'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var useList = snapshot.data!;
            return ListView.builder(
              itemCount: useList.length,
              itemBuilder: (context, index) {
                var user = useList.elementAt(index);
                return Card(
                  color: Colors.yellow,
                  child: ListTile(
                    title: Text(user.name.toString()),
                    subtitle: Text(
                      user.email.toString(),
                    ),
                    trailing: CircleAvatar(
                      child: Text(
                        user.id.toString(),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
