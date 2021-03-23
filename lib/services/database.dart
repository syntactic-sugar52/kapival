import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kap/models/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(Users user) async {
    String retVal = "error";
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "first_name": user.firstName,
        "last_name": user.lastName,
        'created_at': Timestamp.now(),
        "email": user.email,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Users> getUserInfo(String? uid) async {
    Users retVal = Users(
        createdAt: Timestamp.now(),
        email: '',
        firstName: '',
        isActive: '',
        lastName: '',
        profilePhoto: '',
        status: '',
        uid: '');
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('users').doc(uid).get();
      retVal.uid = uid!;
      retVal.firstName = _doc.data()!["firstName"];
      retVal.lastName = _doc.data()!["lastName"];
      retVal.email = _doc.data()!["email"];
      retVal.profilePhoto = _doc.data()!["profilePhoto"];
      retVal.status = _doc.data()!["status"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
