import 'package:flutter/material.dart';
class donorProfilePage extends StatefulWidget {
  const donorProfilePage({super.key});

  @override
  State<donorProfilePage> createState() => _profilePageState();
}

class _profilePageState extends State<donorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 520.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
          ),
          Positioned(
            top: 120,
            left: 80,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8, color: Colors.black54, spreadRadius: 5)
                  ]),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: 400,
              left: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          
                        ),
                        color: Colors.grey[500],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                        ),
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Card(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                        ),
                        color: Colors.grey[500],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                        ),
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 25,
                  ),
                  Row(children: [
                    Card(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                      ),

                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                      ),
                      color: Colors.black,
                    )
                  ],),
                 Row(children: [
                    Card(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                      ),

                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                      ),
                      color: Colors.black,
                    )
                  ],),
                ],
              ))
        ],
      ),
    );
  }
}