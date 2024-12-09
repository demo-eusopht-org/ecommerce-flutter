import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:shopping/MainScreens/next_screen.dart';
import 'package:shopping/models/cart_model.dart';
import 'package:shopping/models/my_cart_model.dart';

import '../auth_pages/login_page.dart';
import 'next_screen.dart';
import 'next_screen.dart';

class AddCart extends StatefulWidget {
  final int? qua;
  AddCart({
    super.key,
    this.qua,
  });

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int quantity = 0;
  int simpleIntInput = 0;
  int _itemCount = 0;
  bool get props => false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
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
          ],
        ),
        backgroundColor: Colors.amber.shade50,
        body: SingleChildScrollView(
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Cart')
                    // .where('uid',
                    //     isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .orderBy('createdAt', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data!.docs
                        .map((doc) {
                          final model = MyCart.fromMap(doc.data());

                          return model;
                        })
                        .toSet()
                        .toList();
                    return Column(
                      children: List.generate(items.length, (index) {
                        Map<String, dynamic> hello = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              height: height * 0.2,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  tileColor: Colors.white,
                                  trailing: IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('Cart')
                                          .doc(snapshot.data!.docs[index].id)
                                          .delete();
                                    },
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      color: Colors.black87,
                                      size: 30,
                                    ),
                                  ),
                                  leading: Image(
                                    image:
                                        NetworkImage('${items[index].image}'),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      items[index].title ?? 'No name',
                                      maxLines: 2,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Quantity:'),
                                            Text(
                                              '${hello['quantity']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text('Total price:'),
                                            Text(
                                                '${items[index].price! * hello['quantity']} ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  quantity = hello['quantity'];
                                                  quantity++;
                                                  FirebaseFirestore.instance
                                                      .collection('Cart')
                                                      .doc(snapshot
                                                          .data!.docs[index].id)
                                                      .update({
                                                    'quantity': quantity,
                                                    'price': items[index].price
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add_circle,
                                                color: Colors.black54,
                                                size: 30,
                                              ),
                                            ),
                                            Text('${hello['quantity']}'),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  quantity = hello['quantity'];
                                                  quantity--;
                                                  FirebaseFirestore.instance
                                                      .collection('Cart')
                                                      .doc(snapshot
                                                          .data!.docs[index].id)
                                                      .update({
                                                    'quantity': quantity,
                                                    'price': items[index].price
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.black54,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Text(items[index].price.toString() ?? 'No name'),
                          ],
                        );
                      }),
                    );
                    // return ListView.builder(
                    //     reverse: true,
                    //     shrinkWrap: true,
                    //     itemCount: snapshot.data!.docs.length,
                    //     itemBuilder: (context, index) {
                    //       Map<String, dynamic> MyCart = snapshot.data!.docs[index]
                    //           .data() as Map<String, dynamic>;
                    //       if (MyCart['uid'] ==
                    //           FirebaseAuth.instance.currentUser!.uid) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.only(
                    //               topLeft: Radius.circular(50),
                    //               bottomRight: Radius.circular(50),
                    //             ),
                    //           ),
                    //           margin: EdgeInsets.all(10),
                    //           height: height * 0.3,
                    //           child: Center(
                    //             child: Column(children: [
                    //               ListTile(
                    //                l
                    //                 ),
                    //                 title: Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Text(
                    //                     '${MyCart['title']}',
                    //                     maxLines: 2,
                    //                   ),
                    //                 ),
                    //                 // subtitl
                    //                 //e: Column(
                    //                 //     crossAxisAlignment:
                    //                 //         CrossAxisAlignment.start,
                    //                 //     children: [
                    //                 //       QuantityInput(
                    //                 //         elevation: 12,
                    //                 //         acceptsZero: true,
                    //                 //         buttonColor: Colors.black,
                    //                 //         iconColor: Colors.white,
                    //                 //         value: simpleIntInput,
                    //                 //         onChanged: (value) => setState(
                    //                 //           () => simpleIntInput = int.parse(
                    //                 //             value.replaceAll(',', ''),
                    //                 //           ),
                    //                 //         ),
                    //                 //       ),
                    //                 trailing: IconButton(
                    //                   onPressed: () {
                    //                     FirebaseFirestore.instance
                    //                         .collection('Cart')
                    //                         .doc(snapshot.data!.docs[index].id)
                    //                         .delete();
                    //                   },
                    //                   icon: Icon(
                    //                     Icons.delete_rounded,
                    //                     color: Colors.black87,
                    //                     size: 30,
                    //                   ),
                    //                 ),

                    //                 subtitle: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(
                    //                       children: [
                    //                         Padding(
                    //                           padding: const EdgeInsets.all(7.0),
                    //                           child: Text('Quantity:'),
                    //                         ),
                    //                         Text(
                    //                           '${MyCart['quantity']}',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     // Text(
                    //                     //   '${myCart['price']}',
                    //                     //   style:
                    //                     //       TextStyle(fontWeight: FontWeight.bold),
                    //                     // ),
                    //                     Padding(
                    //                       padding: const EdgeInsets.all(8.0),
                    //                       child: Row(
                    //                         children: [
                    //                           Text('Total Price:'),
                    //                           Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(8.0),
                    //                             child: Text(
                    //                               '${MyCart['price'] * MyCart['quantity']}',
                    //                               style: TextStyle(
                    //                                   fontWeight:
                    //                                       FontWeight.w900),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),

                    // Container(
                    //   child: Row(
                    //     children: <Widget>[
                    //       _itemCount != 1
                    //           ? Container(
                    //               margin: EdgeInsets.only(
                    //                   right: 15),
                    //               color: Colors.black,
                    //               child: new IconButton(
                    //                   icon: new Icon(
                    //                     Icons.remove,
                    //                     color: Colors.white,
                    //                   ),
                    //                   onPressed: () {
                    //                     setState(() {
                    //                       _itemCount--;
                    //                       FirebaseFirestore
                    //                           .instance
                    //                           .collection(
                    //                               'Cart')
                    //                           .doc(snapshot
                    //                               .data!
                    //                               .docs[index]
                    //                               .id)
                    //                           .update({
                    //                         'quantity':
                    //                             _itemCount,
                    //                       });
                    //                     });
                    //                   }),
                    //             )
                    //           : new Container(),
                    //       new Text(
                    //         myCart['quantity'].toString(),
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.w500,
                    //             fontSize: 25),
                    //       ),
                    //       Container(
                    //         color: Colors.black,
                    //         margin: EdgeInsets.only(left: 15),
                    //         child: new IconButton(
                    //             icon: new Icon(
                    //               Icons.add,
                    //               color: Colors.white,
                    //             ),
                    //             onPressed: () {
                    //               setState(() {
                    //                 _itemCount++;
                    //                 FirebaseFirestore.instance
                    //                     .collection('Cart')
                    //                     .doc(snapshot.data!
                    //                         .docs[index].id)
                    //                     .update({
                    //                   'quantity': _itemCount,
                    //                 });
                    //               });
                    //             }),
                    //       )
                    //     ],
                    //   ),
                    // ),

                    //               Column(
                    //                 children: [
                    //                   Row(
                    //                     children: [
                    //                       Padding(
                    //                           padding: EdgeInsets.only(left: 70)),
                    //                       IconButton(
                    //                           onPressed: () {
                    //                             setState(() {
                    //                               quantity = MyCart['quantity'];
                    //                               quantity++;
                    //                               FirebaseFirestore.instance
                    //                                   .collection('Cart')
                    //                                   .doc(snapshot
                    //                                       .data!.docs[index].id)
                    //                                   .update({
                    //                                 'quantity': quantity,
                    //                                 // 'price': myCart['price']
                    //                               });
                    //                             });
                    //                           },
                    //                           icon: Icon(
                    //                             Icons.add_circle,
                    //                             color: Colors.black54,
                    //                             size: 30,
                    //                           )),
                    //                       Text('${MyCart['quantity']}'),
                    //                       MyCart['quantity'] == 0
                    //                           ? SizedBox()
                    //                           : IconButton(
                    //                               onPressed: () {
                    //                                 setState(() {
                    //                                   quantity =
                    //                                       MyCart['quantity'];
                    //                                   quantity--;
                    //                                   FirebaseFirestore.instance
                    //                                       .collection('Cart')
                    //                                       .doc(snapshot.data!
                    //                                           .docs[index].id)
                    //                                       .update({
                    //                                     'quantity': quantity,
                    //                                     // 'price': myCart['price']
                    //                                   });
                    //                                 });
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.remove_circle,
                    //                                 color: Colors.black54,
                    //                                 size: 30,
                    //                               ),
                    //                             ),
                    //                     ],
                    //                   ),

                    //                   // QuantityInput(
                    //                   //   elevation: 12,
                    //                   //   acceptsZero: true,
                    //                   //   buttonColor: Colors.black,
                    //                   //   iconColor: Colors.white,
                    //                   //   value: simpleIntInput,
                    //                   //   onChanged: (value) => setState(
                    //                   //     () => simpleIntInput = int.parse(
                    //                   //       value.replaceAll(',', ''),
                    //                   //     ),
                    //                   //   ),
                    //                   // ),
                    //                 ],
                    //               ),
                    //             ]),
                    //           ),
                    //         );
                    //       } else {
                    //         return SizedBox();
                    //       }
                    //     });
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
