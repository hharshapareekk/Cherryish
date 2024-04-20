import 'package:cherryish/constants/globalVariables.dart';
import 'package:cherryish/screens/donee/pages/category-deals.dart';
import 'package:flutter/material.dart';

Widget TopCategories(BuildContext context) {
  @override
  void navigateToCategoryPage( BuildContext context,String category){
    Navigator.pushNamed(context, CategoryDeals.routeName,arguments: category);
  }
  return Container(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: GlobalVariable.TopCategoryImages.length,
      itemBuilder: (context, index) {
  
        final category = GlobalVariable.TopCategoryImages[index];
        final imagePath = category['image'];
  
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              navigateToCategoryPage(context, GlobalVariable.TopCategoryImages[index]['title']!);
            },
            child: Container(
              
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Color(0xffFFCCE5),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage(imagePath as String),
                  height: 20,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
