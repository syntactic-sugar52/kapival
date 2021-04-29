// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/state_manager.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:kap/auth/welcome_screen.dart';
// import 'package:kap/dashboard/dashboard_binding.dart';
// import 'package:kap/models/user_model/userController.dart';
// import 'package:kap/dashboard/dahsboard.dart';
// import 'package:kap/models/user_model/user_model.dart';

// import 'package:kap/services/database.dart';
// import 'package:uuid/uuid.dart';
// // import 'package:kap/services/firebase_auth_service.dart';

// class FirebaseUser {
//   final String uid;
//   final String idToken;
//   final String email;
//   const FirebaseUser({
//     @required this.uid,
//     @required this.idToken,
//     @required this.email,
//   });
// }

// class AuthController extends GetxController {
//   var userController = Get.put(UserController());
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Rxn<User> _firebaseUser = Rxn<User>();
//   String get email => _firebaseUser.value?.email;
//   User get user => _firebaseUser.value;
//   User currentUser;
//   final Uuid _uuid = Uuid();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();

//   @override
//   onInit() {
//     // TODO: implement onInit
//     _firebaseUser.bindStream(_auth.authStateChanges());
//     super.onInit();
//   }

//   GoogleSignIn _googleSignIn =
//       GoogleSignIn(scopes: ['email']); //initialization with scope as Email
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   Future<FirebaseUser> _userFromFirebase(User user) async {
//     if (user != null) {
//       String idToken = await user.getIdToken();
//       return FirebaseUser(
//         uid: user.uid,
//         idToken: idToken,
//         email: user.email,
//       );
//     }
//     return null;
//   }

//   Future<FirebaseUser> signInWithGoogle() async {
//     GoogleSignIn _googleSignIn = GoogleSignIn(
//       scopes: [
//         'email',
//         'https://www.googleapis.com/auth/contacts.readonly',
//       ],
//     );

//     GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
//     GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
//     final UserCredential _authResult =
//         await _auth.signInWithCredential(credential);
//     return await _userFromFirebase(_authResult.user);
//   }

//   void google_signOut() async {
//     await googleSignIn.signOut().then((value) => Get.offAll(WelcomeScreen()));
//   }

//   // void login(String email, String password) async {
//   //       Get.find<UserController>().user =
//   //        await Database().getUser(_authResult.user.uid);
//   //   await _auth
//   //       .signInWithEmailAndPassword(email: email, password: password)
//   //       .then((value) => Get.offAll(Dashboard()))
//   //       .catchError(
//   //           (onError) => Get.snackbar("Error while sign in ", onError.message));
//   // }

//   void createUser(
//       String firstName, String lastName, String email, String password) async {
//     try {
//       UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       UserModel _user = UserModel(
//         uid: _authResult.user.uid,
//         firstName: firstName,
//         lastName: lastName,
//         postId: _uuid.v4(),
//         email: email,
//         createdAt: Timestamp.now(),
//         // profilePhoto: "",
//       );
//       if (await Database().createNewUser(_user)) {
//         Get.find<UserController>().user = _user;

//         Get.offAll(Dashboard(), binding: DashboardBinding());
//       }
//     } catch (e) {
//       Get.snackbar("Error creating account", e.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   void login(String email, String password) async {
//     try {
//       UserCredential _authResult = await _auth.signInWithEmailAndPassword(
//           email: email.trim(), password: password);
//       emailController.clear();
//       passwordController.clear();
//       Get.find<UserController>().user =
//           await Database().getUser(_authResult.user.uid);

//       Get.offAll(Dashboard());
//     } catch (e) {
//       Get.snackbar("Error logging in", e.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   void signOut() async {
//     try {
//       await _auth.signOut();
//       Get.find<UserController>().clear();
//       Get.offAll(WelcomeScreen());
//     } catch (e) {
//       Get.snackbar("Error singing out", e.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
// }
