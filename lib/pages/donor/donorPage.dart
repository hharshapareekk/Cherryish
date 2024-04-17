import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
import 'package:cherryish/pages/donor/bottomNavBar.dart';
import 'package:flutter/material.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({Key? key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    color: Colors.blue,
                    height: 200,
                    width: 400,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            'List New Item',
                            style: textStyles.title,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.add,
                            size: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Have A Look At Your Recent Items",
                    style: textStyles.title,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: imageContainerDecorations(
                              Database.items.values.elementAt(4).cover),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(context),
    );
  }
}
