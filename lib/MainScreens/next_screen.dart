import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:shopping/MainScreens/add_cart.dart';
import 'package:shopping/MainScreens/dababase.dart';
import 'package:shopping/models/product_model.dart';
import 'package:shopping/MainScreens/home_page.dart';
import 'package:uuid/uuid.dart';

class Nextscreen extends StatefulWidget {
  String? title;
  double? rating;
  num? rate;
  String? description;
  int? count;
  String? image;
  double? price;
  int? simpleIntInput;
  String? id;

  Nextscreen({
    this.id,
    this.title,
    this.rate,
    this.count,
    this.image,
    this.description,
    this.rating,
    this.price,
    this.simpleIntInput,
  });

  @override
  State<Nextscreen> createState() => _NextscreenState();
}

List<ProductsModel> productModels = [];
int quantity = 0;
int simpleIntInput = 0;

bool isCartUploaded = false;

class _NextscreenState extends State<Nextscreen> {
  @override
  void initState() {
    quantity = 0;
    // TODO: implement initState
    super.initState();
  }

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
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCart(
                      qua: quantity,
                    ),
                  ),
                );
              },
            ),
          ],
          // title: IconButton(
          //   icon: Icon(
          //     Icons.logout,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     FirebaseAuth.instance
          //         .signOut()
          //         .then((value) => Get.offAll(AddCart()));
          //   },
          // ),
        ),
        body: Stack(
          children: [
            Container(color: Colors.amber.shade50),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30, left: 20),
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Icon(
            //       Icons.arrow_back,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.blue,
                    //       offset: Offset(0.0, 1.0), //(x,y)
                    //       blurRadius: 2,
                    //       spreadRadius: 1)
                    // ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  margin: EdgeInsets.all(40),
                  height: height * 0.7,
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image(
                            image: NetworkImage('${widget.image}'),
                            fit: BoxFit.cover,
                            height: height * 0.2,
                            width: width * 0.4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.title}',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            '${widget.description}',
                            style:
                                GoogleFonts.roboto(color: Colors.grey.shade600),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${widget.rating}',
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Price'),
                            Text(
                              '${widget.price}',
                              style: GoogleFonts.roboto(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.black54,
                                    size: 30,
                                  )),
                              Text('$quantity'),
                              quantity == 0
                                  ? SizedBox()
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                    ),
                            ],
                          )
                          // QuantityInput(
                          //     elevation: 12,
                          //     acceptsZero: true,
                          //     buttonColor: Colors.black,
                          //     iconColor: Colors.white,
                          //     value: simpleIntInput,
                          //     onChanged: (value) => setState(() =>
                          //         simpleIntInput =
                          //             int.parse(value.replaceAll(',', '')))),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 40),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: Colors.amber.shade50,
                            ),
                            onPressed: () {
                              if (quantity == 0) {
                                final snackBar = SnackBar(
                                  content: Text('First Select the Quantity'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                String postId = Uuid().v1();
                                ShoppingDatabase().SaveCart(
                                  createdAt: Timestamp.now(),
                                  timeStamp: DateTime.now().toString(),
                                  id: widget.id,
                                  price: widget.price,
                                  rating: widget.rating,
                                  simpleIntInput: quantity,
                                  image: widget.image,
                                  title: widget.title,
                                  description: widget.description,
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  context: context,
                                );
                              }
                            },
                            child: Text(
                              'Add To Cart',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
