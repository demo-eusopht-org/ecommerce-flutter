import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/MainScreens/add_cart.dart';
import 'package:shopping/MainScreens/next_screen.dart';
import 'package:shopping/auth_pages/login_page.dart';
import 'package:shopping/models/product_model.dart';
import 'package:shopping/models/services.dart';

import '../models/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// int? currentIndex = 0;
List<ProductsModel>? matchList = [];

class _HomePageState extends State<HomePage> {
  // Future<void> getFeatured() async {
  //   var response = await Webservice.allProducts(
  //       Apis.products, '''{"query":"","variables":{}}''');

  //   setState(() {
  //     productModel = ProductsModel.fromJson(jsonDecode(response));
  //     print('$response hello');

  //     //  matchList =
  //   });
  // }

  List<ProductsModel> productModels = [];

  Future<void> getProducts() async {
    var response = await Webservice.allProducts(
      Apis.products,
    );
    log('$response getting response');
    final model = jsonDecode(response);
    print('LENGTH: ${model.length}');
    for (int i = 0; i < model.length; i++) {
      productModels.add(ProductsModel.fromJson(model[i]));
      setState(() {});
    }
    log('${productModels.length} value');
  }

  Future<void> initialization() async {
    await getProducts();
  }

  void initState() {
    // TODO: implement initState
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.amber.shade50,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCart()));
              },
            ),
          ],
          title: IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Get.offAll(LoginPage()));
            },
          ),
        ),
        body: productModels.isNotEmpty
            ? SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      height: height,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Cart')
                              .snapshots(),
                          builder: (context, snapshot) {
                            return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1 / 1.4,
                                        crossAxisCount: 2),
                                itemCount: productModels.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Nextscreen(
                                                id: productModels[index]
                                                    .id
                                                    .toString(),
                                                image:
                                                    productModels[index].image,
                                                price: productModels[index]
                                                    .price!
                                                    .toDouble(),
                                                title:
                                                    productModels[index].title,
                                                description:
                                                    productModels[index]
                                                        .description,
                                                rating: productModels[index]
                                                    .rating!
                                                    .rate!
                                                    .toDouble()),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, right: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        margin: EdgeInsets.only(top: 20),

                                        // height: 100,
                                        // width: 100,
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        '${productModels[index].image}'),
                                                    height: height * 0.1,
                                                    width: width * 0.2,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  // height: height * 0.01,
                                                  // width: 200,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Text(
                                                          '${productModels[index].title}',
                                                          maxLines: 3,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(
                                                      //       right: 5, left: 5),
                                                      //   child: Text(
                                                      //     '${productModels[index].description}',
                                                      //     maxLines: 3,
                                                      //   ),
                                                      // ),
                                                      Text(
                                                        '${productModels[index].rating!.rate}',
                                                        maxLines: 2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //     width:
                                            //         MediaQuery.of(context).size.width * 0.9,
                                            //     height:
                                            //         MediaQuery.of(context).size.height * 0.07,
                                            //     child: ElevatedButton(
                                            //         child: Row(
                                            //           mainAxisAlignment:
                                            //               MainAxisAlignment.center,
                                            //           children: [
                                            //             Text('Add to cart'),
                                            //             Padding(
                                            //               padding:
                                            //                   const EdgeInsets.only(left: 20),
                                            //               child: Icon(Icons.shopping_cart),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //         style: ElevatedButton.styleFrom(
                                            //           shape: RoundedRectangleBorder(
                                            //               borderRadius:
                                            //                   BorderRadius.circular(20)),

                                            //           primary:
                                            //               Colors.blue, // Background color
                                            //           onPrimary: Colors.black,
                                            //         ),
                                            //         onPressed: () {}))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );

                                  // return Padding(
                                  //   padding: const EdgeInsets.only(top: 30),
                                  //   child: Text('${productModels.first.title}'),
                                  // );
                                });
                          }),
                    ),
                  )
                ]),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
// Future<String> likePost(String postId, String uid, List likes) async {
//     String res = "Some error occurred";
//     try {
//       if (likes.contains(uid)) {
//         // if the likes list contains the user uid, we need to remove it
//         db.collection('Posts').doc(postId).update({
//           'likes': FieldValue.arrayRemove([uid])
//         });
//       } else {
//         // else we need to add uid to the likes array
//         db.collection('Posts').doc(postId).update({
//           'likes': FieldValue.arrayUnion([uid])
//         });
//       }
//       res = 'success';
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
