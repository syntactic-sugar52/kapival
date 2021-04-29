import 'package:flutter/material.dart';
import 'package:kap/models/information_model.dart';
import 'package:kap/services/database.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

class InformationProvider extends ChangeNotifier {
  String _postId;
  String userUid;
  String videoUrl;
  List<Information> _info = [];
  bool _isLoading;

  bool get isLoading => _isLoading;
  List<Information> get items {
    return [..._info];
  }

  String get postId => _postId;
  String get videoFile => videoUrl;
  Information findById(String id) {
    return _info.firstWhere((info) => info.userUid == id);
  }

  Future getVideo(context) async {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    await Database().getInformationData(_user.currentUser.postId);
  }

  List<Information> findByUser(String userId) {
    return _info.where((info) => info.userUid == userId).toList();
  }
}
