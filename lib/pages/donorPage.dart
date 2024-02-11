import 'package:cherryish/pages/donorProfilePage.dart';
import 'package:cherryish/pages/donorShopPage.dart';
import 'package:flutter/material.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({super.key});

  @override
  State<DonorPage> createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 720),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.home, size: 60),
              ),
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.stacked_line_chart,
                size: 50,
              ),
              SizedBox(
                width: 40,
              ),
              InkWell(child: Icon(Icons.storefront, size: 50),onTap:()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DonorShopPage()));
              }),
              SizedBox(
                width: 40,
              ),
              InkWell(
                  child: Icon(Icons.account_circle, size: 50),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => donorProfilePage()));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
