import 'package:cherryish/screens/donee/pages/buyerPage.dart';
import 'package:flutter/material.dart';
Future FinalSubmitAlert(BuildContext context){
  return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Order Successful !!!"),
                  content: const Text("Your Order Has Been Placed"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyerPage()));
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