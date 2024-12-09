import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/my_cart_model.dart';
import 'package:shopping/models/product_model.dart';

class ShoppingDatabase {
  User? user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  SaveCart({
    String? checkId,
    String? id,
    String? uid,
    String? image,
    String? title,
    String? description,
    num? rating,
    int? count,
    int? simpleIntInput,
    double? price,
    String? timeStamp,
    Timestamp? createdAt,
    BuildContext? context,
  }) async {
    try {
      Cart shoppingCart = Cart(
          id: id,
          // timeStamp: timeStamp,
          createdAt: createdAt,
          price: price,
          rating: rating,
          image: image,
          title: title,
          description: description,
          uid: uid,
          simpleIntInput: simpleIntInput);
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc()
          .set(shoppingCart.toMap())
          .then((value) => id == checkId
              ? ScaffoldMessenger.of(context!).showSnackBar(
                  SnackBar(content: Text(' Already Added Successfully')))
              : ScaffoldMessenger.of(context!).showSnackBar(
                  SnackBar(content: Text(' Added Successfully'))));
    } catch (e) {}
  }
}
