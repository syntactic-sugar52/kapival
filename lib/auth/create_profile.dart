import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:kap/auth/components/gender_dialog.dart';
import 'package:kap/dashboard/dahsboard.dart';
import 'package:kap/models/user_model/user_model.dart';
import 'package:kap/screens/home/home.dart';
import 'package:kap/services/database.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'components/custom_dialog.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  String birthday;
  TextEditingController _bdayController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  DateTime selectedDate;
  final Uuid _uuid = Uuid();
  String male;
  String female;
  String lgbt;
  String secret;

  maleValue() {
    setState(() {
      _genderController.text = 'Male';
    });
    print(_genderController.text);
  }

  femaleValue() {
    setState(() {
      _genderController.text = 'Female';
    });
    // print(female);
  }

  lgbtValue() {
    setState(() {
      _genderController.text = 'Lgbt';
    });
    // print(lgbt);
  }

  secretValue() {
    setState(() {
      _genderController.text = 'Prefer not to say ';
    });
    // print(secret);
  }

  Future<String> register() async {
    UserModel _currentUser = UserModel();
    FirebaseAuth auth = FirebaseAuth.instance;
    final User currentUser = await auth.currentUser;
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    String retVal = 'error';
    try {
      var updateUserProfile = UserModel(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          postId: _uuid.v4(),
          email: _emailController.text,
          gender: _genderController.text,
          birthday: _bdayController.text);
      String _returnString =
          await Database().updateNewUser(updateUserProfile, currentUser.uid);
      _currentUser = await Database().getUserInfo(currentUser.uid);
      if (_currentUser != null) {
        if (_returnString == "success") {
          retVal = 'success';
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      }
    } catch (e) {
      print(e);
      retVal = e;
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Container(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your Profile",
                          softWrap: true,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontSize: 28,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
              color: Colors.greenAccent,
              // color: Color(0XFFEFEE81)
            )),
        Positioned(
            top: 140,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                title: Container(
                  height: 50,
                  width: 60,
                  padding: const EdgeInsets.only(top: 14),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: _firstNameController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration.collapsed(
                      hintText: "First Name",
                      // hintTextDirection: ,

                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
            top: 200,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 25,
                        spreadRadius: 2)
                  ]),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.person_outline, color: Colors.black),
                  onPressed: () {},
                ),
                title: Container(
                  height: 50,
                  width: 60,
                  padding: const EdgeInsets.only(top: 14),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: _lastNameController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration.collapsed(
                      hintText: "Last Name",
                      // hintTextDirection: ,

                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
            top: 260,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                title: Container(
                  height: 50,
                  width: 60,
                  padding: const EdgeInsets.only(top: 14),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: _emailController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration.collapsed(
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
            top: 320,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                title: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        selectedDate: selectedDate,
                        onChanged: (DateTime newDate, _) {
                          selectedDate = newDate;
                        },
                        onPressed: () {
                          String bdayFormat =
                              DateFormat(' MMMM ' + " " + ' d ' + " " + 'yyyy')
                                  .format(selectedDate);
                          setState(() {
                            _bdayController.text = bdayFormat;
                          });

                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: _bdayController,
                      enabled: false,
                      cursorColor: Colors.grey,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration.collapsed(
                        hintText: "Birthday",
                        hintStyle: TextStyle(fontWeight: FontWeight.w700),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
            top: 380,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                title: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            GenderDialog(malePressed: () {
                              maleValue();
                              Navigator.pop(context);
                            }, femalePressed: () {
                              femaleValue();
                              Navigator.pop(context);
                            }, lgbtPressed: () {
                              lgbtValue();
                              Navigator.pop(context);
                            }, secretPressed: () {
                              secretValue();
                              Navigator.pop(context);
                            }));
                  },
                  child: Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      cursorColor: Colors.grey,
                      enabled: false,
                      controller: _genderController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration.collapsed(
                        hintText: "Gender",
                        hintStyle: TextStyle(fontWeight: FontWeight.w700),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            )),
        // terms and conditions
        Positioned(
            top: 500,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                    onPressed: register,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueGrey)),
                    child: Text(
                      "Agree and Resgister",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            )),
      ],
    ));
  }
}
