import 'package:cherryish/pages/logins/signUpPage.dart';
import 'package:cherryish/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    ),
  ));
}
