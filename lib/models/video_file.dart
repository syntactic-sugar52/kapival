import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kap/models/product_model/product_model.dart';
import 'package:kap/models/video.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

class VideosAPI extends ChangeNotifier {
  List<ProductModel> listVideos = List<ProductModel>();

  VideosAPI(userUid, postId, context) {
    CurrentUser _user = Provider.of(context, listen: false);
    userUid = _user.currentUser.uid;
    postId = _user.postId;
    load(userUid, postId);
  }

  void load(userUid, postId) async {
    listVideos = await getVideoList(userUid, postId);
  }

  Future<List<ProductModel>> getVideoList(userUid, postId) async {
    // CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    var data = await FirebaseFirestore.instance
        .collection("Post")
        .doc(userUid)
        .collection("Product")
        .doc(postId)
        .get();

    var videoList = <ProductModel>[];
    var videos;

    if (data.exists) {
      await addDemoData(data);
      videos = (await FirebaseFirestore.instance
          .collection("Post")
          .doc(userUid)
          .collection("Product")
          .doc(postId)
          .get());
    } else {
      videos = data;
    }

    videos.docs.forEach((element) {
      ProductModel video = ProductModel.fromJson(element.data());
      videoList.add(video);
    });

    return videoList;
  }

  Future addDemoData(data) async {
    for (var video in data) {
      // await FirebaseFirestore.instance.collection("Product").doc(userId).collection("Video").add(video);
      await FirebaseFirestore.instance.collection("Videos").add(video);
    }
  }
}
