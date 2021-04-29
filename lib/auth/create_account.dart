import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:kap/dashboard/dahsboard.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

enum LoginType { email, google }

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  void _signUpUser(String email, String password, String firstName,
      String lastName, BuildContext context) async {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _user.signUpUser(email, password, firstName, lastName);
      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      }
    } catch (e) {
      print(e);
    }
  }

  buildCreateAccount() {
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "New to Kapival?",
                      style: GoogleFonts.roboto(
                          fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      height: 100,
                      child: TextField(
                        cursorColor: Colors.grey.shade400,
                        controller: firstNameController,
                        decoration: new InputDecoration(
                          hintText: 'First Name',
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      height: 100,
                      child: TextField(
                        cursorColor: Colors.grey.shade400,
                        controller: lastNameController,
                        decoration: new InputDecoration(
                          hintText: 'Last Name',
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 30),
              //         height: 100,
              //         child: TextField(
              //           cursorColor: Colors.grey.shade400,
              //           controller: userNameController,
              //           decoration: new InputDecoration(
              //             hintText: 'Username',
              //             contentPadding: EdgeInsets.all(10.0),
              //             focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(4)),
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.black),
              //             ),
              //             enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(4)),
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.black),
              //             ),
              //             border: new OutlineInputBorder(
              //               borderRadius: const BorderRadius.all(
              //                 const Radius.circular(0.0),
              //               ),
              //               borderSide: new BorderSide(
              //                 color: Colors.black,
              //                 width: 1.0,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      height: 100,
                      child: TextField(
                        cursorColor: Colors.grey.shade400,
                        controller: emailController,
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      height: 100,
                      child: TextField(
                        obscureText: true,
                        cursorColor: Colors.grey.shade400,
                        controller: passwordController,
                        decoration: new InputDecoration(
                          hintText: 'Password',
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 20),
                      // width: 20,
                      // color:
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.green;
                              return Color(
                                  0XFF00334e); // Use the component's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          _signUpUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                              context);
                        },
                        child: Text(
                          "Register",
                          softWrap: true,
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              ElevatedButton(
                child: Text("Google"),
                onPressed: () async {},
              )
            ],
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildCreateAccount();
  }
}
