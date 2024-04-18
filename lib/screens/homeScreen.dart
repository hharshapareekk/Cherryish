import 'package:cherryish/screens/donee/pages/buyerPage.dart';
import 'package:cherryish/screens/donor/pages/donorPage.dart';
import 'package:cherryish/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
      final user = Provider.of<UserProvider>(context).user;
      
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          'WHAT DO YOU WISH TO DO?',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: InkWell(         //clickable container that leads to buyer page
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xFFFEDC56),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, color: Color(0xFFFCD12A)),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                      child: Text(
                    'RECEIVE',
                    style: TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold),
                    
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LottieBuilder.asset('assets/animations/buy_animation.json',height: 189.0,),
                  ),
                  
                ],
              ),
            ),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerPage()));
            },
          ),
        ),
        SizedBox(
          height: 70,
        ),
        Center(
          child: InkWell(     //clickable container that leads to donor page
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xFF291818),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(blurRadius: 10.0, color: Color(0xFF291818)),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                      child: Text(
                    'DONATE',
                    style: TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LottieBuilder.asset('assets/animations/donate_animation.json',height: 180.0,),
                  ),
                ],
              ),
            ),
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => DonorPage()));
            },
          ),
        ),
      ],
    ));
  }
}
