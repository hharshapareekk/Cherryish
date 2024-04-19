import 'package:cherryish/models/product.dart';
import 'package:cherryish/screens/donor/services/donor_services.dart';
import 'package:cherryish/screens/donor/widgets/bottomNavBar.dart';
import 'package:cherryish/screens/donor/widgets/loader.dart';
import 'package:cherryish/widgets/singleProduct.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Product>? products = [];
  final DonorServices donorServices = DonorServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await donorServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      GridView.builder(
                        itemCount: products!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            final productData = products![index];
                            return Column(
                              children: [
                                SizedBox(height: 140,
                                child: SingleProduct(image: productData.images[0]),),
                                Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(child: Text(productData.name,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                  IconButton(onPressed: (){

                                  }, icon: Icon(Icons.delete_outline)),
                                ],)
                              ],
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomBar(context),
          );
  }
}
