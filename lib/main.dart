import 'package:cherryish/pages/logins/signUpPage.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpPage(),)
      );
}