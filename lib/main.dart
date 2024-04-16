import 'package:cherryish/pages/logins/signUpPage.dart';
import 'package:cherryish/providers/userProvider.dart';
import 'package:cherryish/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
final AuthService authService = AuthService();

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
