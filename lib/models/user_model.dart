import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String uid;
  String firstName;
  String lastName;
  String email;
  String isActive;
  String profilePhoto;
  String status;
  Timestamp createdAt;
  Users(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.createdAt,
      this.isActive,
      this.status,
      this.profilePhoto});

  Map<String, dynamic> toMap() {
    return {
      'uids': uid,
      'first_name': firstName,
      'last_name': lastName,
      'profile_photo': profilePhoto,
      'email': email,
      'isActive': isActive,
      'status': status,
      'created_at': createdAt,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Timestamp _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return Users(
      uid: map['uid'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      profilePhoto: map['profile_photo'],
      isActive: map['isActive'],
      status: map['status'],
      email: map['email'],
      createdAt: _createdAt,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));
}
