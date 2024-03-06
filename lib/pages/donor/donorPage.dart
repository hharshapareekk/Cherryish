import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            "Good morning",
            style: TextStyle(color: Colors.black, fontSize: 25.0),
          ),
          backgroundColor: Colors.white,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Your Top Products",
                  style: textStyles.title,
                ),
              ),
              SizedBox(
                height: 170,
                child: GestureDetector(
                  onTap: () {},
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // Access the image path from Database.items map
                      final imagePath =
                          Database.items.values.elementAt(index).cover;
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: imageContainerDecorations(imagePath),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "Add New Items",
                  style: textStyles.title,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: customDecoration(),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 100,
                        ),
                      ),
                      SizedBox(width: 40,),
                     Container(child: Center(child: Text('ADD DETAILS',style: TextStyle(fontSize: 25),))),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
    bottomNavigationBar: BottomAppBar(
      
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(Icons.home,size: 40,),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  onTap: (){
                     
                  },
                  child: Icon(Icons.search,size: 40,)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  onTap: (){
                   
                  },
                  child: Icon(Icons.trolley,size:40,)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: Icon(Icons.history,size: 40,)),
              ),
            ],
          ),
         ),);

  }
}
