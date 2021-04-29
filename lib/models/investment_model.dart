import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Investment extends ChangeNotifier {
  String investmentId;
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

  String videoUrl;
  String lookingFor;
  bool upvote;
  bool downvote;
  Timestamp createdAt;

  Investment(
      {this.price,
      this.lookingFor,
      this.category,
      this.comments,
      this.postId,
      this.description,
      this.investmentId,
      this.about,
      this.downvote,
      this.upvote,
      this.firstName,
      this.lastName,
      this.userUid,
      this.isPrivate,
      this.reviews,
      this.videoUrl,
      this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'investmentId': investmentId,
      'about': about,
      'looking_for': lookingFor,
      'price': price,
      'description': description,
      'isPrivate': isPrivate,
      'reviews': reviews,
      'user_uid': userUid,
      'first_name': firstName,
      'last_name': lastName,
      'post_id': postId,
      'upvote': upvote,
      'downvote': downvote,
      'comments': comments,
      'category': category,
      'created_at': createdAt,
      'video_url': videoUrl,
    };
  }

  factory Investment.fromMap(Map<String, dynamic> map) {
    Timestamp _createdAt;
    if (map == null) return null;

    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Investment(
      investmentId: map['investment_id'],
      about: map['about'],
      lookingFor: map['looking_for'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      isPrivate: map['is_private'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      userUid: map['user_uid'],
      reviews: map['reviews'],
      postId: map['post_id'],
      comments: map['comments'],
      videoUrl: map['video_url'],
      createdAt: _createdAt,
    );
  }
  factory Investment.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Investment(
        investmentId: doc.data()['investment_id'],
        postId: doc.data()['post_id'],
        about: doc.data()['about'],
        description: doc.data()['description'],
        isPrivate: doc.data()['is_private'],
        category: doc.data()['category'],
        videoUrl: doc.data()['videoUrl'],
        firstName: doc.data()['first_name'],
        lastName: doc.data()['last_name'],
        userUid: doc.data()['user_uid'],
        comments: doc.data()['comments'],
        upvote: doc.data()['upvote'],
        downvote: doc.data()['downvote'],
        lookingFor: doc.data()['looking_for'],
        createdAt: doc.data()['createdAt']);
  }
  String toJson() => json.encode(toMap());

  factory Investment.fromJson(String source) =>
      Investment.fromMap(json.decode(source));
}
