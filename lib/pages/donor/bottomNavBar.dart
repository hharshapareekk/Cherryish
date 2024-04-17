import 'package:cherryish/pages/donor/donorPage.dart';
import 'package:cherryish/pages/donor/historyPage.dart';
import 'package:cherryish/pages/donor/profilePage.dart';
import 'package:flutter/material.dart';

Widget BottomBar(BuildContext context) {
  return BottomAppBar(
    child: Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DonorPage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              Icons.home,
              size: 40,
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        GestureDetector(
          onTap: () {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryPage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              Icons.book,
              size: 40,
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              Icons.face,
              size: 40,
            ),
          ),
        ),
      ],
    ),
  );
}
