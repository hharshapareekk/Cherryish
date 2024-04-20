import 'package:cherryish/providers/userProvider.dart';
import 'package:cherryish/screens/donee/pages/buyerPage.dart';
import 'package:cherryish/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyAppBody(),
      ),
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: userProvider.user.token.isNotEmpty ? HomeScreen() : LoginPage(),
          home: BuyerPage(),
        );
      },
    );
  }
}
