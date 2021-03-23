import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Service extends ChangeNotifier {
  String serviceId;
  String serviceName;
  String skill;
  String price; //optional
  String serviceDescription;
  Map serviceReviews;
  String ownerId;
  String ownerName;
  String serviceCategory;
  String serviceDetails;
  String serviceComments;
  String servicetImage;
  String serviceVideoUrl;

  bool upvote;
  bool downvote;
  String forWhat;
  Timestamp createdAt;

  Service(
      {required this.price,
      required this.serviceCategory,
      required this.serviceDescription,
      required this.serviceDetails,
      required this.ownerId,
      required this.ownerName,
      required this.serviceId,
      required this.serviceName,
      required this.serviceReviews,
      required this.skill,
      required this.serviceVideoUrl,
      required this.forWhat,
      required this.downvote,
      required this.upvote,
      required this.servicetImage,
      required this.serviceComments,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'serviceName': serviceName,
      'skill': skill,
      'service_image': servicetImage,
      'price': price,
      'service_description': serviceDescription,
      'service_reviews': serviceReviews,
      'owner_id': ownerId,
      'upvote': upvote,
      'downvote': downvote,
      'for_what': forWhat,
      'service_comments': serviceComments,
      'service_category': serviceCategory,
      'service_details': serviceDetails,
      'created_at': createdAt,
      'service_video_url': serviceVideoUrl,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;
    Timestamp? _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Service(
      serviceId: map['service_id'],
      serviceName: map['service_name'],
      serviceDetails: map['service_details'],
      servicetImage: map['service_image'],
      skill: map['skill'],
      price: map['price'],
      serviceDescription: map['service_description'],
      forWhat: map['for_what'],
      serviceCategory: map['service_category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      serviceReviews: map['service_reviews'],
      ownerId: map['owner_id'],
      ownerName: map['owner_name'],
      serviceComments: map['service_comments'],
      serviceVideoUrl: map['service_video_url'],
      createdAt: _createdAt!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));
}
