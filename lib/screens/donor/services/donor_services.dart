import 'dart:convert';
import 'dart:io';

import 'package:cherryish/constants/error_handling.dart';
import 'package:cherryish/constants/globalVariables.dart';
import 'package:cherryish/constants/utils.dart';
import 'package:cherryish/models/product.dart';
import 'package:cherryish/providers/userProvider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DonorServices {
  void donateProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required List<File> images,
    required bool isPerishable,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic(cloudName, uploadPreset);
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse cloudinaryResponse = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(cloudinaryResponse.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          images: imageUrls,
          category: category,
          isPerishable: isPerishable);
      http.Response res = await http.post(
        Uri.parse('$uri/donor/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandlingFn(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product Added Successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context,  VoidCallback onSuccess) async {
    final userProvider = Provider.of<UserProvider>(context,listen:false);
    List<Product> ProductList = [];
    try {
      http.Response response =
          await http.get(Uri.parse('$uri/donor/delete-product'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandlingFn(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              ProductList.add(
                Product.fromJson(jsonEncode(jsonDecode(response.body)[i])),

              );
              onSuccess();
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return ProductList;
  }

  void deleteProduct({required BuildContext context, required Product product, required VoidCallback onSuccess}) async{
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      
      http.Response res = await http.post(
        Uri.parse('$uri/donor/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandlingFn(
          response: res,
          context: context,
          onSuccess: () {
           onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
