import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kap/root/root.dart';
import 'package:kap/screens/chat.dart';
import 'package:kap/screens/search.dart';
// import 'package:kap/screens/search.dart';
import 'package:kap/screens/upload.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';
// import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'cards.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _topModalData = "";
  TextEditingController _searchController = TextEditingController();
  int currentIndex = 0;
  PageController pageController = PageController();
  bool isSwitched = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final _topModalSheetKey = GlobalKey<TopModalSheetState>();
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  buildSearch() {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        throw (e) {
          e.toString();
        };
      },
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white24,
            // backgroundColor: Color(0XFFF8F5F1),
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Color(0XFFf6f5f5),
              titleSpacing: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.menu), onPressed: () => _openDrawer()),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        //     var value = await Navigator.of(context)
                        //         .push<List<int>>(PageRouteBuilder(
                        //             pageBuilder: (_, __, ___) {
                        //               return TopModalSheet(
                        //                 key: _topModalSheetKey,
                        //                 child: Container(
                        //                     color: Color(0XFFf6f5f5),
                        //                     // padding: const EdgeInsets.all(20),
                        //                     height: MediaQuery.of(context)
                        //                             .size
                        //                             .height *
                        //                         .6,
                        //                     child: Column(
                        //                       children: [
                        //                         SizedBox(
                        //                           height: 20,
                        //                         ),
                        //                         Container(
                        //                           width: MediaQuery.of(context)
                        //                                   .size
                        //                                   .width *
                        //                               0.9,
                        //                           child: Row(
                        //                             mainAxisSize:
                        //                                 MainAxisSize.max,
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .spaceEvenly,
                        //                             crossAxisAlignment:
                        //                                 CrossAxisAlignment.center,
                        //                             children: [
                        //                               Expanded(
                        //                                 child: TextField(
                        //                                   controller:
                        //                                       _searchController,
                        //                                   decoration: InputDecoration(
                        //                                       hintText:
                        //                                           "Enter Search Keyword",
                        //                                       hintStyle:
                        //                                           TextStyle(
                        //                                               fontSize:
                        //                                                   12)),
                        //                                 ),
                        //                               ),
                        //                               Row(
                        //                                 children: [
                        //                                   Container(
                        //                                     padding:
                        //                                         const EdgeInsets
                        //                                                 .only(
                        //                                             top: 38,
                        //                                             left: 10),
                        //                                     child: TextButton(
                        //                                         onPressed: () {
                        //                                           _topModalSheetKey
                        //                                               .currentState!
                        //                                               .onBackPressed(
                        //                                                   data: [
                        //                                                 1,
                        //                                                 2,
                        //                                                 3
                        //                                               ]);
                        //                                         },
                        //                                         child: Text(
                        //                                           ("Close"),
                        //                                           style: GoogleFonts.roboto(
                        //                                               color: Colors
                        //                                                   .black,
                        //                                               decoration:
                        //                                                   TextDecoration
                        //                                                       .underline),
                        //                                         )),
                        //                                   )
                        //                                 ],
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                         Row(
                        //                           children: [
                        //                             Container(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       20),
                        //                               child: Text(
                        //                                   "TOP SEARCH TERMS",
                        //                                   style:
                        //                                       GoogleFonts.roboto(
                        //                                           color: Colors
                        //                                               .black,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .w400)),
                        //                             )
                        //                           ],
                        //                         )
                        //                       ],
                        //                     )),
                        //               );
                        //             },
                        //             opaque: false));

                        //     if (value != null) {
                        //       setState(() {
                        //         _topModalData = "$value";
                        //       });
                        //     }
                        //   },

                        //   // onPressed: _onClickNotification,
                      ),
                    ],
                    //  }
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      'kapival',
                      style: TextStyle(color: Colors.black),
                    )),
                  )
                ],
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(isSwitched ? 'Private' : 'Public',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                          )
                          // TextStyle(color: Colors.black),
                          ),
                    ),
                    Switch(
                      value: isSwitched,
                      activeColor: Colors.green,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    )
                  ],
                )
              ],
              bottom: PreferredSize(
                  child: Container(
                    color: Color(0XFF145374),
                    height: 4.0,
                  ),
                  preferredSize: Size.fromHeight(4.0)),
            ),
            drawer: Container(
              child: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            _closeDrawer();
                          },
                          icon: Icon(Icons.close),
                        )
                      ],
                    ),
                    Container(
                      child: Text("Choose a Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        'Product',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        'Service',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        'Referral',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        'Information',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text(
                        'Investment',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    // Divider(
                    //   color: Colors.grey,
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'Currency',
                    //     textAlign: TextAlign.center,
                    //   ),
                    //   onTap: () {},
                    // ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      title: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () async {
                        CurrentUser _user =
                            Provider.of<CurrentUser>(context, listen: false);
                        String _returnString = await _user.onSignOut();
                        if (_returnString == 'success') {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Root()),
                              (route) => false);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: PageView(
                controller: pageController,
                children: <Widget>[
                  Container(child: SafeArea(child: Cards())),
                  Container(child: SafeArea(child: Chat())),
                  Container(child: SafeArea(child: CameraApp())),
                  Container(child: SafeArea(child: Text('Notifications'))),
                  Container(child: SafeArea(child: Profile())),
                ],
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            bottomNavigationBar: bottomItems()),
      ),
    );
  }

  BottomNavigationBar bottomItems() {
    return BottomNavigationBar(
        selectedItemColor: Color(0xff145374),
        backgroundColor: Color(0XFFf6f5f5),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(
              milliseconds: 30,
            ),
            curve: Curves.easeIn,
          );
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 35.0),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: SizedBox.shrink())
        ]);
  }
}
