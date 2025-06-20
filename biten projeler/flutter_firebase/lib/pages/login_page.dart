// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ super.key });

  @override
   createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the Login Page',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                 
                  
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
 


}
