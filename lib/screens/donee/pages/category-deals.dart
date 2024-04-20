import 'package:cherryish/Styles.dart';
import 'package:flutter/material.dart';

class CategoryDeals extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDeals({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            widget.category,
            style: textStyles.title,
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Kepping Shopping For ${widget.category}',
                style: textStyles.alertButtons,
              ),
            )
          ],
        ));
  }
}
