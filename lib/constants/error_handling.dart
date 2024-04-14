import 'dart:convert';

import 'package:cherryish/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
void httpErrorHandlingFn({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  try {
    if (response.body.isEmpty) {
      showSnackBar(context, 'Empty response from server');
      return;
    }
    
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    
    switch(response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 400:
        if (responseBody.containsKey('msg')) {
          showSnackBar(context, responseBody['msg']);
        } else {
          showSnackBar(context, 'Bad request');
        }
        break;
      case 500:
        if (responseBody.containsKey('error')) {
          showSnackBar(context, responseBody['error']);
        } else {
          showSnackBar(context, 'Internal server error');
        }
        break;
      default:
        if (responseBody.containsKey('error')) {
          showSnackBar(context, responseBody['error']);
        } else {
          showSnackBar(context, 'Unknown error');
        }
    }
  } catch (e) {
    showSnackBar(context, 'Error handling response: $e');
  }
}
