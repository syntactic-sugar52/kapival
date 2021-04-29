import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:kap/screens/chat/chat.dart';
import 'package:kap/screens/home/home.dart';

import 'package:get/get.dart';
import 'package:kap/screens/profile/profile.dart';
// import 'package:kap/screens/second_home.dart';
import 'package:kap/screens/upload/upload_video.dart';
import 'package:path/path.dart';

class Dashboard extends StatefulWidget {
  final String url;
  final List files;
  Dashboard({this.url, this.files});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static String videoFile;
  static List upload;
  int _selectedIndex = 0;

  final List<Widget> bodyContent = [
    HomeState(),
    Chat(),
    CreatePostScreen(),
    Text("Upload video"),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: bodyContent.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFFf6f5f5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              // size: 18,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.add_circled_solid,
              size: 28,
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
