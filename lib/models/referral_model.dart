import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Referral extends ChangeNotifier {
  String referralId;
  String about;
  String price; //optional
  String description;
  Map reviews;
  String postId;
  bool isPrivate;
  String category;
  String firstName;
  String lastName;
  String userUid;
  Map comments;

  String imageUrl;
  String lookingFor;
  int upvote;
  int downvote;
  Timestamp createdAt;

  Referral(
      {this.price,
      this.lookingFor,
      this.category,
      this.comments,
      this.postId,
      this.description,
      this.referralId,
      this.firstName,
      this.lastName,
      this.userUid,
      this.about,
      this.downvote,
      this.upvote,
      this.reviews,
      this.isPrivate,
      this.imageUrl,
      this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'referralId': referralId,
      'about': about,
      'looking_for': lookingFor,
      'price': price,
      'description': description,
      'reviews': reviews,
      'post_id': postId,
      'user_uid': userUid,
      'first_name': firstName,
      'last_name': lastName,
      'upvote': upvote,
      'downvote': downvote,
      'isPrivate': isPrivate,
      'comments': comments,
      'category': category,
      'created_at': createdAt,
      'image_url': imageUrl,
    };
  }

  factory Referral.fromMap(Map<String, dynamic> map) {
    Timestamp _createdAt;
    if (map == null) return null;

    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Referral(
      referralId: map['referral_id'],
      about: map['about'],
      lookingFor: map['looking_for'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      isPrivate: map['is_private'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      userUid: map['user_uid'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      reviews: map['reviews'],
      postId: map['post_id'],
      comments: map['comments'],
      imageUrl: map['image_url'],
      createdAt: _createdAt,
    );
  }
  factory Referral.fromDocument(DocumentSnapshot doc) {
    return Referral(
        referralId: doc.data()['referral_id'],
        postId: doc.data()['post_id'],
        about: doc.data()['about'],
        description: doc.data()['description'],
        isPrivate: doc.data()['is_private'],
        firstName: doc.data()['first_name'],
        lastName: doc.data()['last_name'],
        userUid: doc.data()['user_uid'],
        category: doc.data()['category'],
        imageUrl: doc.data()['image_url'],
        comments: doc.data()['comments'],
        upvote: doc.data()['upvote'],
        downvote: doc.data()['downvote'],
        lookingFor: doc.data()['looking_for'],
        createdAt: doc.data()['createdAt']);
  }
  String toJson() => json.encode(toMap());

  factory Referral.fromJson(String source) =>
      Referral.fromMap(json.decode(source));
}
