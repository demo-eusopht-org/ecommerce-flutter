import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'my_cart_model.dart';

class MyCart extends Equatable {
  //String? timeStamp;
  String? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  num? rating;
  String? simpleIntInput;
  String? uid;

  Timestamp? createdAt;

  MyCart(
      {this.uid,
      this.createdAt,
      this.rating,
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.simpleIntInput});

  factory MyCart.fromMap(map) {
    return MyCart(
      id: map['id'] ?? "",
      // timeStamp: map['timeStamp'] ?? "",
      price: map['price'] ?? "",
      uid: map['uid'] ?? "",
      image: map['image'] ?? "",
      title: map['title'] ?? "",
      rating: map['rating'] ?? "",
      description: map['description'] ?? "",
      simpleIntInput: map['simpleIntInput'] ?? "",
      createdAt: map['createdAt'],
    );
  }
  toMap() {
    return {
      'id': id,
      // 'timeStamp': timeStamp,
      'uid': uid,
      'title': title,
      'image': image,
      'description': description,
      'rating': rating,
      'quantity': simpleIntInput,
      'price': price,
      'createdAt': createdAt,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
