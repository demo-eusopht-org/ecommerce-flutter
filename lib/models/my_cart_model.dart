import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/MainScreens/next_screen.dart';

class Cart {
  // String? timeStamp;
  String? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  num? rating;
  String? uid;
  int? simpleIntInput;

  Timestamp? createdAt;

  Cart(
      {
      // {this.timeStamp,
      this.createdAt,
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.uid,
      this.rating,
      this.simpleIntInput});

  factory Cart.fromMap(map) {
    return Cart(
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
}
