import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kap/auth/auth_controller.dart';
import 'package:kap/auth/welcome_screen.dart';
import 'package:kap/dashboard/dahsboard.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void _logInUser(String email, String password, BuildContext context) async {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString = await _user.loginUser(email, password);
      if (_returnString == "success") {
        _onLoading();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Incorrect email or password.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Signing in..",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buildSignIn() {
    return ListView(children: [
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
                  "WELCOME BACK",
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  height: 100,
                  child: TextField(
                    cursorColor: Colors.grey.shade400,
                    controller: _emailController,
                    decoration: new InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.all(10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  height: 100,
                  child: TextField(
                    obscureText: true,
                    cursorColor: Colors.grey.shade400,
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.all(10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.black),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                  // width: 20,
                  // color:
                  height: 55,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.green;
                          return Color(
                              0XFF00334e); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      _logInUser(_emailController.text,
                          _passwordController.text, context);
                    },
                    child: Text(
                      "Sign in",
                      softWrap: true,
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildSignIn();
  }
}
