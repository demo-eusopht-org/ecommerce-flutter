import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/MainScreens/next_screen.dart';
import 'package:uuid/uuid.dart';

class change extends Object with EquatableMixin {
  final String image;
  final String title;
  final String des;

  change({required this.image, required this.title, required this.des});

  @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is change && runtimeType == other.runtimeType && name == other.name;

  @override
  List<Object> get props => [image,title,des];
}
    