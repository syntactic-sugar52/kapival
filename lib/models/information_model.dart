import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Information extends ChangeNotifier {
  String informationId;
  String informationName;
  String about;
  String price; //optional
  String informationDescription;
  Map informationReviews;
  String ownerId;
  String ownerName;
  String informationCategory;
  String informationDetails;
  String informationComments;
  String informationImage;
  String forWhat;
  String informationVideoUrl;
  bool upvote;
  bool downvote;
  Timestamp createdAt;

  Information(
      {required this.price,
      required this.about,
      required this.informationCategory,
      required this.informationComments,
      required this.ownerId,
      required this.ownerName,
      required this.forWhat,
      required this.informationId,
      required this.informationDescription,
      required this.informationDetails,
      required this.informationImage,
      required this.informationName,
      required this.downvote,
      required this.upvote,
      required this.informationReviews,
      required this.informationVideoUrl,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'serviceId': informationId,
      'informationName': informationName,
      'about': about,
      'information_image': informationImage,
      'price': price,
      'information_description': informationDescription,
      'information_reviews': informationReviews,
      'for_what': forWhat,
      'owner_id': ownerId,
      'upvote': upvote,
      'downvote': downvote,
      'information_comments': informationComments,
      'information_category': informationCategory,
      'information_details': informationDetails,
      'created_at': createdAt,
      'information_video_url': informationVideoUrl,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    // if (map != null)
    Timestamp? _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Information(
      informationId: map['information_id'],
      informationName: map['information_name'],
      informationDetails: map['information_details'],
      informationImage: map['information_image'],
      forWhat: map['for_what'],
      about: map['about'],
      price: map['price'],
      informationDescription: map['information_description'],
      informationCategory: map['information_category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      informationReviews: map['information_reviews'],
      ownerId: map['owner_id'],
      ownerName: map['owner_name'],
      informationComments: map['information_comments'],
      informationVideoUrl: map['information_video_url'],
      createdAt: _createdAt!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Information.fromJson(String source) =>
      Information.fromMap(json.decode(source));
}
