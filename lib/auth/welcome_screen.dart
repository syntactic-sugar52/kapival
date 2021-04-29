import 'package:flutter/material.dart';

import 'create_account.dart';
import 'login.dart';

// class WelcomeScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

class WelcomeScreen extends StatelessWidget {
  buildWelcomeScreen(context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0XFFf6f5f5),
          title: Text(
            "Kapival",
            style: TextStyle(color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Material(
              color: Color(0xff145374),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                indicatorColor: Color(0xffee6f57),
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Sign In",
                  ),
                  Tab(
                    text: "Create an account",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    child: TabBarView(
                      children: [Login(), CreateAccount()],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return buildWelcomeScreen(context);
  }
}
