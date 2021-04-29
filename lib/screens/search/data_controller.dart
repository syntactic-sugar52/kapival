import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var isExecuted = false.obs;
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String query) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('first_name', isGreaterThanOrEqualTo: query)
        .get();
  }

  updateStateExecuted(bool value) {
    isExecuted(value);
  }
  // Future createProduct(String collection){
  //   return
  // }
}
