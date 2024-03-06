import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: imageContainerDecorations(
                      Database.items.values.elementAt(3).cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  Database.items.values.elementAt(3).name,
                  style: textStyles.title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  Database.items.values.elementAt(3).description,
                  style: (textStyles.description),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'DONOR INFORMATION:',
                      style: textStyles.title,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 340,
                  height: 200,
                  decoration: customDecoration(),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 70,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(Database.donors[0].profilePic),
                            radius: 70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name: " + Database.donors[0].name,
                                style: textStyles.description,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Donor ID: " + Database.donors[0].id.toString(),
                                style: textStyles.description,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Location: " + Database.donors[0].location,
                                style: textStyles.description,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Date Added: " +
                                    Database.donors[0].AddedOn.toString(),
                                style: textStyles.description,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Rating: " +
                                    Database.donors[0].rating.toString(),
                                style: textStyles.description,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Images From Donor: ",style: textStyles.title,)),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context,index){
                    final reviewImagePath = Database.items['Dinosaur']!.Item_Images[index];
                    return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: imageContainerDecorations(reviewImagePath),
                          
                        ),
                      );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height:50,
                      decoration: customDecoration(),
                      child: Center(child: Text("ADD TO CART",style: textStyles.alertButtons)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 150,
                      height:50,
                      decoration: customDecoration(),
                      child: Center(child: Text("BUY NOW",style: textStyles.alertButtons,),),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
