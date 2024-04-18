import 'dart:convert';

import 'package:cherryish/constants/error_handling.dart';
import 'package:cherryish/constants/globalVariables.dart';
import 'package:cherryish/constants/utils.dart';
import 'package:cherryish/models/user.dart';
import 'package:cherryish/providers/userProvider.dart';
import 'package:cherryish/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Signup user
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        username: username,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        showSnackBar(
          context,
          'Account has been created! Login with the same credentials.',
        );
      } else {
        httpErrorHandlingFn(
          response: res,
          context: context,
          onSuccess: () {
            // Do nothing
          },
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandlingFn(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      );
    } catch (e) {
      // Handle any exceptions that occur during the signup process
      showSnackBar(context, e.toString());
    }
  }

//get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        var userProvider = Provider.of<UserProvider>(context,listen: false);
        userProvider.setUser(userRes.body);

      }
      
    } catch (e) {
      // Handle any exceptions that occur during the signup process
      showSnackBar(context, e.toString());
    }
  }
}
