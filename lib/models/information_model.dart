import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Information extends ChangeNotifier {
  String informationId;
  String about;
  String price; //optional
  String description;
  Map reviews;
  String postId;
  bool isPrivate;
  String category;
  Map comments;
  String firstName;
  String lastName;
  String userUid;
  String videoUrl;
  String lookingFor;
  bool upvote;
  bool downvote;
  Timestamp createdAt;

  VideoPlayerController controller;
// YoutubePlayerController _controller;
  Information(
      {this.price,
      this.lookingFor,
      this.category,
      this.isPrivate,
      this.comments,
      this.firstName,
      this.lastName,
      this.userUid,
      this.postId,
      this.description,
      this.informationId,
      this.about,
      this.downvote,
      this.upvote,
      this.reviews,
      this.videoUrl,
      this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'informationId': informationId,
      'about': about,
      'looking_for': lookingFor,
      'price': price,
      'description': description,
      'user_uid': userUid,
      'first_name': firstName,
      'last_name': lastName,
      'reviews': reviews,
      'post_id': postId,
      'upvote': upvote,
      'is_private': isPrivate,
      'downvote': downvote,
      'comments': comments,
      'category': category,
      'created_at': createdAt,
      'video_url': videoUrl,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    Timestamp _createdAt;

    if (map == null) return null;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Information(
      informationId: map['information_id'],
      about: map['about'],
      lookingFor: map['looking_for'],
      price: map['price'],
      description: map['description'],
      isPrivate: map['is_private'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      userUid: map['user_uid'],
      category: map['category'],
      upvote: map['upvote'],
      downvote: map['downvote'],
      reviews: map['reviews'],
      postId: map['post_id'],
      comments: map['comments'],
      videoUrl: map['video_url'],
      createdAt: _createdAt,
    );
  }

  factory Information.fromDocument(DocumentSnapshot doc) {
    return Information(
        informationId: doc.data()['information_id'],
        postId: doc.data()['post_id'],
        about: doc.data()['about'],
        description: doc.data()['description'],
        isPrivate: doc.data()['is_private'],
        firstName: doc.data()['first_name'],
        lastName: doc.data()['last_name'],
        userUid: doc.data()['user_uid'],
        category: doc.data()['category'],
        videoUrl: doc.data()['videoUrl'],
        comments: doc.data()['comments'],
        upvote: doc.data()['upvote'],
        downvote: doc.data()['downvote'],
        lookingFor: doc.data()['looking_for'],
        createdAt: doc.data()['createdAt']);
  }

  String toJson() => json.encode(toMap());
  Future loadController() async {
    controller = VideoPlayerController.network(videoUrl);
    await controller.initialize();
    controller.setLooping(true);
  }

  factory Information.fromJson(String source) =>
      Information.fromMap(json.decode(source));
}
