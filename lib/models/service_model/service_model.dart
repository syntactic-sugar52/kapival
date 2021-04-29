import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Service extends ChangeNotifier {
  String serviceId;
  String skill;

  String price; //optional
  String description;
  Map reviews;
  String postId;

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

  Service(
      {this.price,
      this.lookingFor,
      this.category,
      this.comments,
      this.postId,
      this.description,
      this.firstName,
      this.lastName,
      this.userUid,
      this.serviceId,
      this.skill,
      this.downvote,
      this.upvote,
      this.reviews,
      this.imageUrl,
      this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'skill': skill,
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
      'comments': comments,
      'category': category,
      'created_at': createdAt,
      'image_url': imageUrl,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    Timestamp _createdAt;
    if (map == null) return null;

    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Service(
      serviceId: map['service_id'],
      skill: map['skill'],
      lookingFor: map['looking_for'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
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

  factory Service.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Service(
        serviceId: doc.data()['serviceId'],
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
        createdAt: doc.data()['createdAt']);
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));
}
