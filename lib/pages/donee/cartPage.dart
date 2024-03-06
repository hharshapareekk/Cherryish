import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
import 'package:cherryish/pages/donee/finalOrderPage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Cart Page'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final cartItem = Database.items.values.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(cartItem.cover),
                            width: 170,
                            height: 170,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: Database.items.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FinalOrderPage()));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: customDecoration(),
                  child: Center(
                    child: Text(
                      "PROCEED",
                      style: textStyles.alertButtons,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
