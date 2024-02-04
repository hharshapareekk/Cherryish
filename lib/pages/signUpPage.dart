import 'package:cherryish/pages/homeScreen.dart';
import 'package:cherryish/pages/loginPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  child: InkWell(child: Center(child: Text('LOGIN')),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },),
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
                child: Text('                 Username')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                width: 270.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.7))],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text('                  Mail ID')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                width: 270.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.7))],
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
                  style: TextStyle(fontSize: 40.0,color: Colors.white,letterSpacing: 5.0),
                )),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: Colors.white, width: 3.0),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      ),

      // body: Center(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 100,),
      //       InkWell(
      //         child: Container(
      //           color: Colors.blue,
      //           height: 100.0,
      //           width:150.0,
      //           child: Text('This is login page'),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeScreen()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
