import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
void httpErrorHandlingFn({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
  }) {
    switch(response.statusCode){
      case 200:
      onSuccess();
      break;
      case 400:
        showS
    }
  }