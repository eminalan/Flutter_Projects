// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, use_super_parameters, camel_case_types

import 'package:flutter/material.dart';
import 'package:vb10/widget/button_widget.dart';
import 'package:vb10/widget/logo_widget.dart';
import 'package:vb10/widget/text_widget.dart';

class Spotif_login_page extends StatelessWidget {
  const Spotif_login_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            spotfiy_logo(),
            const SizedBox(height: 25),
            login_to_spotfiy_text(),
            const SizedBox(height: 150),
            facebook_login("Continue with Facebook"),
            const SizedBox(height: 10),
            google_login("Continue with Google"),
            const SizedBox(height: 10),
            apple_login("Continue with Apple"),
            const SizedBox(height: 100),
            log_in_button("Log in"),
            SizedBox(height: 25),
            forgot_your_password_text(),
          ],
        ),
      ),
    );
  }
}
