import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Investment extends ChangeNotifier {
  String investmentId;
  String investmentName;
  String statistics;
  String price; //optional
  String investmentDescription;
  Map investmentReviews;
  String ownerId;
  String ownerName;
  String investmentCategory;
  String investmentDetails;
  String investmentComments;
  String investmentImage;
  String investmentVideoUrl;
  String forWhat;
  bool upvote;
  bool downvote;
  Timestamp createdAt;

  Investment(
      {required this.price,
      required this.forWhat,
      required this.investmentCategory,
      required this.investmentComments,
      required this.ownerId,
      required this.ownerName,
      required this.investmentDescription,
      required this.investmentDetails,
      required this.investmentId,
      required this.investmentImage,
      required this.investmentName,
      required this.downvote,
      required this.upvote,
      required this.investmentReviews,
      required this.investmentVideoUrl,
      required this.statistics,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'investmentId': investmentId,
      'investmentName': investmentName,
      'statistics': statistics,
      'investment_image': investmentImage,
      'price': price,
      'investment_description': investmentDescription,
      'investment_reviews': investmentReviews,
      'owner_id': ownerId,
      'upvote': upvote,
      'downvote': downvote,
      'investment_comments': investmentComments,
      'investment_category': investmentCategory,
      'invesment_details': investmentDetails,
      'created_at': createdAt,
      'investment_video_url': investmentVideoUrl,
      'for_what': forWhat
    };
  }

  factory Investment.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;
    Timestamp? _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Investment(
      investmentId: map['invesment_id'],
      investmentName: map['investment_name'],
      investmentDetails: map['investment_details'],
      investmentImage: map['investment_image'],
      statistics: map['statistics'],
      price: map['price'],
      investmentDescription: map['investment_description'],
      investmentCategory: map['investment_category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      investmentReviews: map['investment_reviews'],
      ownerId: map['owner_id'],
      ownerName: map['owner_name'],
      investmentComments: map['investment_comments'],
      investmentVideoUrl: map['referral_video_url'],
      forWhat: map['for_what'],
      createdAt: _createdAt!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Investment.fromJson(String source) =>
      Investment.fromMap(json.decode(source));
}
