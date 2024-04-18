import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cherryish/Styles.dart';
import 'package:cherryish/constants/utils.dart';
import 'package:cherryish/screens/donor/services/donor_services.dart';
import 'package:cherryish/screens/donor/widgets/finalAddAlert.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  bool isPerishable = false;
  List<File> images = [];
  final DonorServices donorServices = DonorServices();
  final _addProductFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
  }

  void SelectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void donateProduct() {
    if (_addProductFormKey.currentState!.validate()  && images.isNotEmpty) {
      donorServices.donateProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          category: categoryController.text,
          images: images,
          isPerishable: isPerishable);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Add A Product',
            style: textStyles.title,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          Form(
            key: _addProductFormKey,
            child: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images.map(
                              (i) {
                                return Builder(
                                  builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                );
                              },
                            ).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              SelectImages();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              width: 300,
                              height: 300,
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.file_copy),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Select Product Images',
                                      style: textStyles.title,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 5.0),
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: productNameController,
                              decoration: InputDecoration(
                                  hintText: 'Product Name',
                                  hintStyle: textStyles.title),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Product Name';
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  hintText: 'Description',
                                  hintStyle: textStyles.title),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Description';
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextFormField(
                              controller: categoryController,
                              decoration: InputDecoration(
                                  hintText: 'Category',
                                  hintStyle: textStyles.title),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select A Category';
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 43,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text('  Perishable ?'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          donateProduct();
                          FinalAddAlert(context);
                          
                        },
                        child: Container(
                          color: Colors.blue,
                          width: 100,
                          height: 50,
                          child: Center(
                              child: Text(
                            'Submit',
                            style: textStyles.alertButtons,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
