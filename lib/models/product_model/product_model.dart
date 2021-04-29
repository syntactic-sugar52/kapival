import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProductModel extends ChangeNotifier {
  String productId;
  String item;
  String brand;
  String price;
  String description;
  Map reviews;
  String firstName;
  String lastName;
  String userUid;
  String postId;
  String category;
  Map comments;
  String imageUrl;
  int upvote;
  int downvote;
  String lookingFor;

  Timestamp createdAt;
  ProductModel(
      {this.price,
      this.brand,
      this.category,
      this.description,
      this.imageUrl,
      this.postId,
      this.productId,
      this.firstName,
      this.lastName,
      this.userUid,
      this.item,
      this.lookingFor,
      this.reviews,
      this.comments,
      this.downvote,
      this.upvote,
      this.createdAt});
  VideoPlayerController controller;
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'item': item,
      'brand': brand,
      'image_url': imageUrl,
      'price': price,
      'user_uid': userUid,
      'first_name': firstName,
      'last_name': lastName,
      'description': description,
      'reviews': reviews,
      'post_id': postId,
      'upvote': upvote,
      'downvote': downvote,
      'comments': comments,
      'category': category,
      'looking_for': lookingFor,
      'created_at': createdAt
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    Timestamp _createdAt;
    if (map == null) return null;

    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return ProductModel(
      productId: map['product_id'],
      item: map['item'],
      brand: map['brand'],
      price: map['price'],
      description: map['description'],
      imageUrl: map['image_url'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      userUid: map['user_uid'],
      category: map['category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      lookingFor: map['looking_for'],
      reviews: map['reviews'],
      postId: map['post_id'],
      createdAt: _createdAt,
      comments: map['comments'],
    );
  }

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    return ProductModel(
        productId: doc.data()['productId'],
        item: doc.data()['item'],
        brand: doc.data()['brand'],
        price: doc.data()['price'],
        postId: doc.data()['postId'],
        description: doc.data()['description'],
        firstName: doc.data()['first_name'],
        lastName: doc.data()['last_name'],
        userUid: doc.data()['user_uid'],
        category: doc.data()['category'],
        imageUrl: doc.data()['image_url'],
        comments: doc.data()['comments'],
        upvote: doc.data()['upvote'],
        downvote: doc.data()['downvote'],
        lookingFor: doc.data()['looking_for'],
        createdAt: doc['createdAt']);
  }
  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
