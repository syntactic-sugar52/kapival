import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kap/models/user_model.dart';
import 'package:kap/services/database.dart';
import 'package:provider/provider.dart';

class CurrentUser extends ChangeNotifier {
  Users _currentUser = Users();
  Users get getCurrentUser => _currentUser;
  String _uid;
  String _email;
  String _firstName;
  String get getUid => _uid;
  String get getEmail => _email;
  String get getFirstName => _currentUser.firstName;
  String get getLastName => _currentUser.lastName;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = 'error';
    try {
      User _firebaseUser = await _auth.currentUser;
      _currentUser.uid = _firebaseUser.uid;
      _currentUser.email = _firebaseUser.email;
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String firstName, String lastName) async {
    String retVal = "error";
    Users _user = Users();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.firstName = firstName;
      _user.lastName = lastName;
      String _returnString = await Database().createUser(_user);
      if (_returnString == "success") {
        retVal = 'success';
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = 'error';

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _currentUser.uid = _authResult.user.uid;
        _currentUser.email = _authResult.user.email;
        retVal = 'success';
      }
    } catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String> onSignOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      _currentUser = Users();
      retVal = "success";
    } catch (e) {
      print(e);
    }

    notifyListeners();
    return retVal;
  }
}
