import 'package:cherryish/pages/logins/signUpPage.dart';
import 'package:cherryish/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _formkey; // Initialize _formkey
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


@override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

   void SignInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Row(
                ///deals with toggling between login and signup page
                children: [
                  SizedBox(
                    width: 200.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 70,
                    child: Center(child: Text('LOGIN')),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 50,
                    width: 70,
                    child: InkWell(
                      child: Center(
                        child: Text('SIGNUP'),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 10.0),
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
                child: Text('                  Username / Mail ID'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signInFormKey,


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
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        letterSpacing: 8.0),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                ),
                onTap: () {
                   if (_signInFormKey.currentState!.validate()) {
                            SignInUser();
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

