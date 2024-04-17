import 'package:cherryish/pages/donor/donorPage.dart';
import 'package:flutter/material.dart';
Future FinalAddAlert(BuildContext context){
  return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Successful !!!"),
                  content: const Text("Your Product Has Been Listed For Donation"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorPage()));
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 80,
                        height: 50,
                        padding: const EdgeInsets.all(14),
                        child: const Text("Close",style: TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              );
}