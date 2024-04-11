import 'package:cherryish/pages/homeScreen.dart';
import 'package:cherryish/pages/logins/loginPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> _formkey; // Initialize _formkey

  String email = '';
  String password = '';
  String username = '';

  @override
  void initState() {
    super.initState();
    _formkey = GlobalKey<FormState>(); // Initialize _formkey
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 70,
                    child: InkWell(
                      child: Center(child: Text('LOGIN')),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 50,
                    width: 70,
                    child: Center(
                      child: Text('SIGNUP'),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 10.0,
                ),
              ),
              Text(
                'Pass it On, Play it Forward: Donate the Fun Way!',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('                 Username'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixText: '   ',
                      hintText: "  Enter your username or email",
                    ),
                    validator: (value) {
                      if (value!.length < 3) { // Added null check for value
                        return 'Username is small';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        username = value!;
                      });
                    },
                  ),
                  height: 50.0,
                  width: 270.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.7))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('                 Mail'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    key: ValueKey('Mail id'),
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixText: '   ',
                      hintText: '   Enter Mail',
                    ),
                    validator: (value) {
                      if (!(value!.contains('@'))) { // Added null check for value
                        return 'invalid email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  height: 50.0,
                  width: 270.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.7))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('                 Password'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    key: ValueKey('Password'),
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixText: '   ',
                      hintText: '   Enter Password',
                    ),
                    validator: (value) {
                      if (value!.length < 6) { // Added null check for value
                        return 'Password is small';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  height: 50.0,
                  width: 270.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.7))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              InkWell(
                child: Container(
                  height: 70.0,
                  width: 230.0,
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          letterSpacing: 5.0),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                ),
                onTap: () {
  if (_formkey.currentState!.validate()) {
    _formkey.currentState!.save();
    if (email.isNotEmpty && password.isNotEmpty) { // Check if email and password are not empty
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      print('Email or password is empty.');
    }
  }
}, 

              )
            ],
          ),
        ),
      ),
    );
  }
}
