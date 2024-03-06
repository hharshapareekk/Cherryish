import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
import 'package:cherryish/pages/donee/cartPage.dart';
import 'package:cherryish/pages/donee/orderHistory.dart';
import 'package:cherryish/pages/donee/productPage.dart';
import 'package:cherryish/pages/donee/searchPage.dart';
import 'package:flutter/material.dart';

class BuyerPage extends StatefulWidget {
  const BuyerPage({Key? key});

  @override
  State<BuyerPage> createState() => _DonorPageState();
}
class _DonorPageState extends State<BuyerPage> {

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
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 6.0,
                mainAxisExtent:
                    40, // Aspect ratio of each item (width / height)
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final path =  Database.items.values.elementAt(index).cover;
                  final productName = Database.items.values.elementAt(index).name;
                  index = index + 1;
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
                    child: ListTile(
                      leading: Image(image: AssetImage(path),width: 40,height: 40,),
                      title: Text(
                        productName,
                        style: TextStyle(fontSize: 15),
                      ),
                      iconColor: Colors.red,
                    ),
                  );
                },
                childCount: 5,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Recommended For You",
                    style: textStyles.title,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
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
                    "Best Sellers",
                    style: textStyles.title,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 160,
                            height: 160,
                            
                            decoration:imageContainerDecorations( Database.items.values.elementAt(3).cover),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "Based on your recent purchases",
                    style: textStyles.title,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: imageContainerDecorations( Database.items.values.elementAt(4).cover),
                           
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "Products Nearby You",
                    style: textStyles.title,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: imageContainerDecorations( Database.items.values.elementAt(index).cover),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text("Your location",style: textStyles.title,),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: customDecoration(),
                    
                  ),
                ),
              )
              ],

            ),
          ),
        
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                  },
                  child: Icon(Icons.search,size: 40,)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                  },
                  child: Icon(Icons.trolley,size:40,)),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHistory()));
                  },
                  child: Icon(Icons.history,size: 40,)),
              ),
            ],
          ),
         ),
    );
  }
}
