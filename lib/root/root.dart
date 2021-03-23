import 'package:flutter/material.dart';
import 'package:kap/auth/welcome_screen.dart';
import 'package:kap/screens/home.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    String returnString = await _user.onStartUp();
    if (returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = WelcomeScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = Home();
        break;
      default:
    }
    return retVal!;
  }
}
