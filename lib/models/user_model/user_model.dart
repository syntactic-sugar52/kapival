import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String firstName;
  String lastName;
  String email;
  String postId;
  String profilePhoto;
  String country;
  String mobileNumber;
  String gender;
  String birthday;

  // String postId;
  Timestamp createdAt;

  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.postId,
      this.country,
      this.gender,
      this.birthday,
      this.email,
      this.createdAt,
      this.profilePhoto});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Timestamp _createdAt;
    if (map['created_at'] is Timestamp) {
      _createdAt = map['created_at'];
    } else if (map['created_at'] is Map) {
      _createdAt = Timestamp(
          map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
    }

    return UserModel(
      uid: map['uid'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      mobileNumber: map['mobile_number'],
      birthday: map['birthday'],
      gender: map['gender'],
      country: map['country'],
      postId: map['post_id'],
      profilePhoto: map['profile_photo'],
      email: map['email'],
      createdAt: _createdAt,
    );
  }
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
        uid: doc.data()['uid'],
        firstName: doc.data()['first_name'],
        lastName: doc.data()['last_name'],
        birthday: doc.data()['birthday'],
        gender: doc.data()['gender'],
        country: doc.data()['country'],
        mobileNumber: doc.data()['mobile_number'],
        email: doc.data()['email'],
        postId: doc.data()['post_id'],
        profilePhoto: doc.data()['profile_photo'],
        createdAt: doc.data()['created_at']);
  }

  // Map<String, dynamic> toJson(){
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
