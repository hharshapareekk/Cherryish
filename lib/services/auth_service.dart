import 'package:cherryish/constants/error_handling.dart';
import 'package:cherryish/constants/globalVariables.dart';
import 'package:cherryish/constants/utils.dart';
import 'package:cherryish/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //signup user
  void signUpUser({
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
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandlingFn(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Account Has Been Created! Login With Same Credentials');
      },);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
