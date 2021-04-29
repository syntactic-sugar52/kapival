import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String imageUrl;
  final String description;
  final int likeCount;
  final int dislikeCount;
  final String lookingFor;
  final String authorId;
  final Timestamp timestamp;
  String cardType;
  Post({
    this.id,
    this.imageUrl,
    this.description,
    this.lookingFor,
    this.dislikeCount,
    this.likeCount,
    this.authorId,
    this.timestamp,
    this.cardType,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': userUid,
  //     'post_id': postId,
  //     'card_id': cardId,
  //     'card_type': cardType,
  //     'created_at': createdAt,
  //   };
  // }

  factory Post.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Timestamp _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Post(
      id: map['user_uid'],
      authorId: map['post_id'],
      cardType: map['card_type'],
      likeCount: map['card_id'],
      timestamp: _createdAt,
      lookingFor: map['looking_for'],
      description: map['description'],
    );
  }

  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      id: doc.id,
      imageUrl: doc.data()['imageUrl'],
      description: doc.data()['description'],
      likeCount: doc.data()['likeCount'],
      lookingFor: doc.data()['lookingFor'],
      authorId: doc.data()['authorId'],
      timestamp: doc.data()['timestamp'],
    );
  }
  // String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
