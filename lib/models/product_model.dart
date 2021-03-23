import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String productId;
  String productName;
  String brand;
  String price;
  String productDescription;
  Map reviews;
  String ownerId;
  String ownerName;
  String category;
  String productDetails;
  String comments;
  String productImage;
  String videoUrl;
  bool upvote;
  bool downvote;
  String forWhat;
  Timestamp createdAt;
  Product(
      {required this.price,
      required this.brand,
      required this.category,
      required this.productDescription,
      required this.ownerId,
      required this.videoUrl,
      required this.ownerName,
      required this.productDetails,
      required this.productId,
      required this.productName,
      required this.forWhat,
      required this.reviews,
      required this.comments,
      required this.downvote,
      required this.upvote,
      required this.productImage,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'brand': brand,
      'product_image': productImage,
      'video_url': videoUrl,
      'price': price,
      'product_description': productDescription,
      'reviews': reviews,
      'owner_id': ownerId,
      'upvote': upvote,
      'downvote': downvote,
      'comments': comments,
      'category': category,
      'for_what': forWhat,
      'product_details': productDetails,
      'created_at': createdAt
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;
    Timestamp? _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Product(
      productId: map['product_id'],
      productName: map['product_name'],
      productDetails: map['product_details'],
      productImage: map['profile_image'],
      brand: map['brand'],
      price: map['price'],
      productDescription: map['product_description'],
      videoUrl: map['video_url'],
      category: map['category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      forWhat: map['for_what'],
      reviews: map['reviews'],
      ownerId: map['owner_id'],
      ownerName: map['owner_name'],
      createdAt: _createdAt!,
      comments: map['comments'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
