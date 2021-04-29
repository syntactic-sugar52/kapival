import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kap/models/information_model.dart';
import 'package:kap/models/investment_model.dart';
import 'package:kap/models/post_model/post_model.dart';
import 'package:kap/models/product_model/product_model.dart';
import 'package:kap/models/referral_model.dart';
import 'package:kap/models/service_model/service_model.dart';
import 'package:kap/models/user_model/user_model.dart';

// import 'package:kap/screens/video_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final Reference storageRef = FirebaseStorage.instance.ref();
final usersRef = FirebaseFirestore.instance.collection("users");
final productRef = FirebaseFirestore.instance.collection("Product");
final postRef = FirebaseFirestore.instance.collection("Post");
final serviceRef = FirebaseFirestore.instance.collection("Service");
final infoRef = FirebaseFirestore.instance.collection("Information");
final referralRef = FirebaseFirestore.instance.collection("Referral");
final investmentRef = FirebaseFirestore.instance.collection("Investment");
final postProductRef = FirebaseFirestore.instance
    .collection("Post")
    .doc()
    .collection("Product\\")
    .doc();

class Database {
  static void createPost(Post post) {
    postRef.doc(post.authorId).collection('userPosts').add({
      'imageUrl': post.imageUrl,
      'caption': post.description,
      'dislike': post.dislikeCount,
      'looking_for': post.lookingFor,
      'likeCount': post.likeCount,
      'authorId': post.authorId,
      'timestamp': post.timestamp,
    });
  }

// static void upload()async{
//   String name = DateTime.now().millisecondsSinceEpoch.toString();
// //sample name 1351441456747
//      final Reference storageReference =
//                       FirebaseStorage().ref().child("posts/$name");

//                   final UploadTask uploadTask =
//                       storageReference.putFile(videofile);

//                   final StreamSubscription<TaskEvent> streamSubscription =
//                       uploadTask.events.listen((event) {

//                     // Here, every StorageTaskEvent concerning the upload is printed to the logs.
//                     print('EVENT ${event.type}');
//                   });

//                   await uploadTask.onComplete;
//                   streamSubscription.cancel();
//                   String videourl =
//                       await (await uploadTask.onComplete).ref.getDownloadURL();
//   }
  Future uploadToStorage(File file, userId, String url) async {
    // CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    // String retVal = 'error';

    try {
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = (millSeconds.toString() + " - " + userId);
      final String today = ('$month-$date');

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child("video").child(today).child(storageId);
      MediaInfo mediaInfo = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.HighestQuality,
        includeAudio: true,
        deleteOrigin: false,
      );
      UploadTask uploadTask = ref.putFile(File(mediaInfo.path));
      TaskSnapshot downloadUrl = (await uploadTask);
      String download = await ref.getDownloadURL();
      String url = downloadUrl.toString();
      return download;
    } catch (error) {
      print(error);
      // retVal = error.toString();
    }
    // return retVal;
  }

//Referral

  Future<String> createReferral(Referral referral, String refId, String postId,
      String firstName, String lastName, String userUid) async {
    String retVal = "error";
    try {
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Referral")
          .doc(refId)
          .set({
        "about": referral.about,
        "referral_id": refId,
        'created_at': referral.createdAt,
        "description": referral.description,
        "image_url": referral.imageUrl,
        "post_id": postId,
        "reviews": referral.reviews,
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "upvote": referral.upvote,
        "downvote": referral.downvote,
        "looking_for": referral.lookingFor,
        "price": referral.price,
        "category": referral.category,
        "comments": referral.comments
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Referral> getReferralData(String postId) async {
    Referral retVal = Referral();
    try {
      DocumentSnapshot _doc = await referralRef.doc(postId).get();
      retVal.postId = postId;
      retVal.referralId = _doc.data()["referral_id"];
      retVal.about = _doc.data()["about"];
      retVal.createdAt = _doc.data()["created_at"];
      retVal.description = _doc.data()["description"];
      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      retVal.userUid = _doc.data()["user_uid"];
      retVal.lookingFor = _doc.data()["looking_for"];
      retVal.price = _doc.data()["price"];
      retVal.category = _doc.data()["category"];
      retVal.comments = _doc.data()["comments"];

      retVal.reviews = _doc.data()["reviews"];
      retVal.imageUrl = _doc.data()["image_url"];
      retVal.upvote = _doc.data()["upvote"];
      retVal.downvote = _doc.data()["downvote"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

//Information
  Future<String> createInformation(Information info, String postId,
      String firstName, String lastName, String userUid) async {
    String retVal = "error";
    try {
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Information")
          .doc(postId)
          .set({
        "about": info.about,
        "information_id": info.informationId,
        'created_at': Timestamp.now(),
        "description": info.description,
        "video_url": info.videoUrl,
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "post_id": postId,
        "isPrivate": info.isPrivate,
        "reviews": info.reviews,
        "upvote": info.upvote,
        "downvote": info.downvote,
        "looking_for": info.lookingFor,
        "price": info.price,
        "category": info.category,
        "comments": info.comments
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Information> getInformationData(String postId) async {
    Information retVal = Information();
    try {
      DocumentSnapshot _doc = await infoRef.doc(postId).get();
      retVal.postId = postId;
      retVal.informationId = _doc.data()["information_id"];
      retVal.about = _doc.data()["about"];
      retVal.createdAt = _doc.data()["created_at"];
      retVal.description = _doc.data()["description"];
      retVal.lookingFor = _doc.data()["looking_for"];
      retVal.price = _doc.data()["price"];
      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      retVal.userUid = _doc.data()["user_uid"];
      retVal.category = _doc.data()["category"];
      retVal.comments = _doc.data()["comments"];
      retVal.isPrivate = _doc.data()["isPrivate"];
      retVal.reviews = _doc.data()["reviews"];
      retVal.videoUrl = _doc.data()["video_url"];
      retVal.upvote = _doc.data()["upvote"];
      retVal.downvote = _doc.data()["downvote"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  static Future<Information> getUserPost(String userId, String postId) async {
    DocumentSnapshot infoDocSnapshot = await infoRef.doc(postId).get();
    return Information.fromDocument(infoDocSnapshot);
  }
  // static Future<List<Information>> getInfo(String postId) async {
  //   DocumentSnapshot userInfoSnapshot = await infoRef.doc().get();

  //   // .orderBy('timestamp', descending: true)

  //   List<Information> info =
  //       userInfoSnapshot.data().map((doc) => Information.fromDocument(doc));
  //       // fromMap((doc) => Activity.fromDoc(doc)).toList();
  //   return activity;
  // }

//Investment
  Future<String> createInvestment(Investment investment, String postId,
      String firstName, String lastName, String userUid) async {
    String retVal = "error";
    try {
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Investment")
          .doc(postId)
          .set({
        "about": investment.about,
        "investment_id": investment.investmentId,
        'created_at': Timestamp.now(),
        "description": investment.description,
        "video_url": investment.videoUrl,
        "post_id": postId,
        "isPrivate": investment.isPrivate,
        "reviews": investment.reviews,
        "upvote": investment.upvote,
        "downvote": investment.downvote,
        "looking_for": investment.lookingFor,
        "price": investment.price,
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "category": investment.category,
        "comments": investment.comments
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Investment> getInvestmentInfo(String postId) async {
    Investment retVal = Investment();
    try {
      DocumentSnapshot _doc = await investmentRef.doc(postId).get();
      retVal.postId = postId;
      retVal.investmentId = _doc.data()["investment_id"];
      retVal.about = _doc.data()["about"];
      retVal.createdAt = _doc.data()["created_at"];
      retVal.description = _doc.data()["description"];
      retVal.lookingFor = _doc.data()["looking_for"];
      retVal.price = _doc.data()["price"];
      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      retVal.userUid = _doc.data()["user_uid"];
      retVal.category = _doc.data()["category"];
      retVal.comments = _doc.data()["comments"];
      retVal.isPrivate = _doc.data()["isPrivate"];
      retVal.reviews = _doc.data()["reviews"];
      retVal.videoUrl = _doc.data()["video_url"];
      retVal.upvote = _doc.data()["upvote"];
      retVal.downvote = _doc.data()["downvote"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

//Product
  Future<String> createProduct(ProductModel product, String productId,
      String postId, String firstName, String lastName, String userUid) async {
    String retVal = "error";

    try {
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Product")
          .doc(productId)
          .set({
        "item": product.item,
        'created_at': product.createdAt,
        "description": product.description,
        "product_id": productId,
        "image_url": product.imageUrl,
        "reviews": product.reviews,
        "post_id": postId,
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "upvote": product.upvote,
        "downvote": product.downvote,
        "looking_for": product.lookingFor,
        "price": product.price,
        "category": product.category,
        "comments": product.comments
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<ProductModel> getProductInfo(String postId) async {
    ProductModel retVal = ProductModel();
    try {
      DocumentSnapshot _doc = await productRef.doc(postId).get();

      retVal.productId = _doc.data()["product_id"];
      retVal.item = _doc.data()["item"];
      retVal.brand = _doc.data()["brand"];
      retVal.createdAt = _doc.data()["created_at"];
      retVal.description = _doc.data()["description"];
      retVal.lookingFor = _doc.data()["looking_for"];
      retVal.price = _doc.data()["price"];
      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      retVal.userUid = _doc.data()["user_uid"];
      retVal.category = _doc.data()["category"];
      retVal.comments = _doc.data()["comments"];
      retVal.postId = _doc.data()["post_id"];
      retVal.reviews = _doc.data()["reviews"];
      retVal.imageUrl = _doc.data()["image_url"];
      retVal.upvote = _doc.data()["upvote"];
      retVal.downvote = _doc.data()["downvote"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

//Service
  Future<String> createService(Service service, String serviceId, String postId,
      String firstName, String lastName, String userUid) async {
    String retVal = "error";

    try {
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Service")
          .doc(serviceId)
          .set({
        "skill": service.skill,
        'created_at': service.createdAt,
        "description": service.description,
        "product_id": serviceId,
        "image_url": service.imageUrl,
        "reviews": service.reviews,
        "post_id": postId,
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "upvote": service.upvote,
        "downvote": service.downvote,
        "looking_for": service.lookingFor,
        "price": service.price,
        "category": service.category,
        "comments": service.comments
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Service> getServiceInfo(String postId) async {
    Service retVal = Service();
    try {
      DocumentSnapshot _doc = await serviceRef.doc(postId).get();
      retVal.postId = postId;
      retVal.serviceId = _doc.data()["service_id"];
      retVal.skill = _doc.data()["skill"];
      retVal.createdAt = _doc.data()["created_at"];
      retVal.description = _doc.data()["description"];
      retVal.lookingFor = _doc.data()["looking_for"];
      retVal.price = _doc.data()["price"];
      retVal.category = _doc.data()["category"];
      retVal.comments = _doc.data()["comments"];

      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      retVal.userUid = _doc.data()["user_uid"];
      retVal.reviews = _doc.data()["reviews"];
      retVal.imageUrl = _doc.data()["image_url"];
      retVal.upvote = _doc.data()["upvote"];
      retVal.downvote = _doc.data()["downvote"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

//post
  // Future<bool> createNewPost(Post post) async {
  //   try {
  //     await postRef.doc(post.postId).set({
  //       "userUid": post.userUid,
  //       // "card_id": post.cardId,
  //       "card_type": post.cardType,
  //       "post_id": post.postId,
  //       "created_at": Timestamp.now(),
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<Post> getPostInfo(String uid) async {
  //   Post retVal = Post();
  //   try {
  //     DocumentSnapshot _doc = await postRef.doc(uid).get();
  //     retVal.userUid = uid;
  //     retVal.cardId = _doc.data()["card_id"];
  //     retVal.cardType = _doc.data()["card_type"];
  //     retVal.createdAt = _doc.data()["created_at"];
  //     retVal.postId = _doc.data()["post_id"];
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // //Users

  Future<String> createNewUser(UserModel user) async {
    String retVal = 'error';
    try {
      await usersRef.doc(user.uid).set({
        "uid": user.uid,
        "first_name": "",
        "last_name": "",
        "country": user.country,
        "gender": "",
        "birthday": "",

        "mobile_number": user.mobileNumber,
        // "post_id": user.postId,
        "email": "",
        "created_at": Timestamp.now(),
      });
      return 'success';
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<String> updateNewUser(UserModel user, uid) async {
    String retVal = 'error';
    try {
      await usersRef.doc(uid).update({
        // "uid": user.uid,
        "first_name": user.firstName,
        "last_name": user.lastName,
        "country": user.country,
        "gender": user.gender,
        "birthday": user.birthday,

        // "mobile_number": user.mobileNumber,
        "post_id": user.postId,
        "email": user.email,
        // "created_at": Timestamp.now(),
      });
      return 'success';
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel retVal = UserModel();
    try {
      DocumentSnapshot _doc = await usersRef.doc(uid).get();
      retVal.uid = uid;
      retVal.firstName = _doc.data()["first_name"];
      retVal.lastName = _doc.data()["last_name"];
      // retVal.userName = _doc.data()["user_name"];
      retVal.birthday = _doc.data()["birthday"];
      retVal.gender = _doc.data()["gender"];
      retVal.country = _doc.data()["country"];
      retVal.mobileNumber = _doc.data()["mobile_number"];
      retVal.email = _doc.data()["email"];
      retVal.profilePhoto = _doc.data()["profilePhoto"];
      retVal.postId = _doc.data()["post_id"];
      retVal.createdAt = _doc.data()["created_at"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
