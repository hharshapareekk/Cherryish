import 'package:cherryish/screens/logins/loginPage.dart';
import 'package:cherryish/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> _formkey; // Initialize _formkey
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void SignUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
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
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      Container(
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
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                          
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
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
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                           
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
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
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            // You can add more specific password validation logic if needed
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 80),
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
                          if (_signUpFormKey.currentState!.validate()) {
                            SignUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
