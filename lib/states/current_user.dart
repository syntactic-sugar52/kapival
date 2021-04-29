import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kap/models/post_model/post_model.dart';

import 'package:kap/models/user_model/user_model.dart';
import 'package:kap/services/database.dart';
import 'package:uuid/uuid.dart';
// import 'package:provider/provider.dart';

class CurrentUser extends ChangeNotifier {
  UserModel _currentUser = UserModel();
  Post _postModel = Post();
  Post get currentPost => _postModel;
  UserModel get currentUser => _currentUser;
  String _uid;
  String _email;
  String get uid => _currentUser.uid;
  String get email => _currentUser.email;
  String get postId => _currentUser.postId;
  String get getFirstName => _currentUser.firstName;
  String get getLastName => _currentUser.lastName;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Uuid _uuid = Uuid();

  Future<String> onStartUp() async {
    String retVal = 'error';
    try {
      User _firebaseUser = await _auth.currentUser;
      if (_firebaseUser != null) {
        _currentUser = await Database().getUserInfo(_firebaseUser.uid);
        if (_currentUser != null) {
          retVal = 'success';
        }
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  Future<String> signUpUser(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    String retVal = "error";
    UserModel _user = UserModel();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.firstName = firstName;
      _user.lastName = lastName;
      // _user.userName = userName;
      _user.postId = _uuid.v4();

      String _returnString = await Database().createNewUser(_user);

      _currentUser = await Database().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        if (_returnString == "success") {
          retVal = 'success';
        }
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      retVal = e.toString();
    }
    notifyListeners();
    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = 'error';

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await Database().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retVal = 'success';
      }
    } catch (e) {
      retVal = e.toString();
    }
    notifyListeners();
    return retVal;
  }

  Future<String> onSignOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      _currentUser = UserModel();

      retVal = "success";
    } catch (e) {
      print(e);
    }

    notifyListeners();
    return retVal;
  }
}
