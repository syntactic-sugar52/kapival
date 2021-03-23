import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Referral extends ChangeNotifier {
  String referralId;
  String referralName;
  String what;
  String price; //optional
  String referralDescription;
  Map referralReviews;
  String ownerId;
  String ownerName;
  String referralCategory;
  String referralDetails;
  String referralComments;
  String referralImage;
  String referralVideoUrl;
  String forWhat;
  bool upvote;
  bool downvote;
  Timestamp createdAt;

  Referral(
      {required this.price,
      required this.forWhat,
      required this.referralCategory,
      required this.referralComments,
      required this.ownerId,
      required this.ownerName,
      required this.referralDescription,
      required this.referralDetails,
      required this.referralId,
      required this.referralImage,
      required this.referralName,
      required this.downvote,
      required this.upvote,
      required this.referralReviews,
      required this.referralVideoUrl,
      required this.what,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'referralId': referralId,
      'referralName': referralName,
      'what': what,
      'referral_image': referralImage,
      'price': price,
      'referral_description': referralDescription,
      'referral_reviews': referralReviews,
      'owner_id': ownerId,
      'upvote': upvote,
      'downvote': downvote,
      'referral_comments': referralComments,
      'referral_category': referralCategory,
      'referral_details': referralDetails,
      'created_at': createdAt,
      'referral_video_url': referralVideoUrl,
      'for_what': forWhat
    };
  }

  factory Referral.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;
    Timestamp? _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Referral(
      referralId: map['referral_id'],
      referralName: map['referral_name'],
      referralDetails: map['referral_details'],
      referralImage: map['referral_image'],
      what: map['about'],
      price: map['price'],
      referralDescription: map['referral_description'],
      referralCategory: map['referral_category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      referralReviews: map['referral_reviews'],
      ownerId: map['owner_id'],
      ownerName: map['owner_name'],
      referralComments: map['referral_comments'],
      referralVideoUrl: map['referral_video_url'],
      forWhat: map['for_what'],
      createdAt: _createdAt!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Referral.fromJson(String source) =>
      Referral.fromMap(json.decode(source));
}
