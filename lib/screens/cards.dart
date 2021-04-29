// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:kap/models/feed_view_model.dart';
// import 'package:kap/models/information_model.dart';
// import 'package:kap/models/video.dart';
// import 'package:kap/models/video_file.dart';
// import 'package:get_it/get_it.dart';

// import 'package:kap/services/database.dart';

// import 'package:provider/provider.dart';
// // import 'package:better_player/better_player.dart';
// import 'package:video_player/video_player.dart';
// import '../states/current_user.dart';

// class Cards extends StatefulWidget {
//   final Widget endDrawer;
//   final String url;

//   Cards({this.endDrawer, this.url});
//   @override
//   _CardsState createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   Information infoData;
//   // int index;

//   final locator = GetIt.instance;
//   final feedViewModel = GetIt.instance<FeedViewModel>();
//   @override
//   void initState() {
//     feedViewModel.loadVideo(0);
//     feedViewModel.loadVideo(1);

//     super.initState();
//   }

//   Widget videoScreen() {
//     return Scaffold(
//       backgroundColor: GetIt.instance<FeedViewModel>().actualScreen == 0
//           ? Colors.black
//           : Colors.white,
//       body: Stack(
//         children: [
//           PageView.builder(
//             itemCount: 2,
//             onPageChanged: (value) {
//               print(value);
//               if (value == 1)
//                 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//               else
//                 SystemChrome.setSystemUIOverlayStyle(
//                     SystemUiOverlayStyle.light);
//             },
//             itemBuilder: (context, index) {
//               if (index == 0)
//                 return scrollFeed();
//               else
//                 return profileView();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Widget scrollFeed() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Expanded(child: currentScreen()),
//         BottomBar(),
//       ],
//     );
//   }

//   Widget feedVideos() {
//     return Stack(
//       children: [
//         PageView.builder(
//           controller: PageController(
//             initialPage: 0,
//             viewportFraction: 1,
//           ),
//           itemCount: feedViewModel.videoSource.listVideos.length,
//           onPageChanged: (index) {
//             index = index % (feedViewModel.videoSource.listVideos.length);
//             feedViewModel.changeVideo(index);
//           },
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             index = index % (feedViewModel.videoSource.listVideos.length);
//             return videoCard(feedViewModel.videoSource.listVideos[index]);
//           },
//         ),
//         SafeArea(
//           child: Container(
//             padding: EdgeInsets.only(top: 20),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Following',
//                       style: TextStyle(
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.white70)),
//                   SizedBox(
//                     width: 7,
//                   ),
//                   Container(
//                     color: Colors.white70,
//                     height: 10,
//                     width: 1.0,
//                   ),
//                   SizedBox(
//                     width: 7,
//                   ),
//                   Text('For You',
//                       style: TextStyle(
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white))
//                 ]),
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget currentScreen() {
//   //   switch (feedViewModel.actualScreen) {
//   //     case 0:
//   //       return feedVideos();
//   //     case 1:
//   //       return SearchScreen();
//   //     case 2:
//   //       return MessagesScreen();
//   //     case 3:
//   //       return ProfileScreen();
//   //     default:
//   //       return feedVideos();
//   //   }
//   // }

//   Widget videoCard(Video video) {
//     return Stack(
//       children: [
//         video.controller != null
//             ? GestureDetector(
//                 onTap: () {
//                   if (video.controller.value.isPlaying) {
//                     video.controller.pause();
//                   } else {
//                     video.controller.play();
//                   }
//                 },
//                 child: SizedBox.expand(
//                     child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: SizedBox(
//                     width: video.controller.value.size?.width ?? 0,
//                     height: video.controller.value.size?.height ?? 0,
//                     child: VideoPlayer(video.controller),
//                   ),
//                 )),
//               )
//             : Container(
//                 color: Colors.black,
//                 child: Center(
//                   child: Text("Loadingd123"),
//                 ),
//               ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Text("Tool bar anduser name")
//                 // VideoDescription(video.user, video.videoTitle, video.songName),
//                 // ActionsToolbar(video.likes, video.comments,
//                 //     "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
//               ],
//             ),
//             SizedBox(height: 20)
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     feedViewModel.controller.dispose();
//     super.dispose();
//   }

//   // buildCards(context) {
//   //   ;

//   //   // Scaffold(
//   //   //   key: _scaffoldKey,
//   //   // backgroundColor: Colors.white24,
//   //   // backgroundColor: Color(0XFFF8F5F1),
//   //   return SingleChildScrollView(
//   //     child: Column(
//   //       children: [
//   //         // Row(
//   //         //   mainAxisAlignment: MainAxisAlignment.center,
//   //         //   crossAxisAlignment: CrossAxisAlignment.center,
//   //         //   children: [
//   //         //     Expanded(
//   //         //       child: Container(
//   //         //         height: 40,
//   //         //         padding: const EdgeInsets.only(left: 10, top: 8),
//   //         //         // width: _size.width,
//   //         //         child: ElevatedButton(
//   //         //           style: ButtonStyle(
//   //         //             backgroundColor:
//   //         //                 MaterialStateProperty.resolveWith<Color>(
//   //         //               (Set<MaterialState> states) {
//   //         //                 if (states.contains(MaterialState.pressed))
//   //         //                   return Color(0XFFF8F5F1);

//   //         //                 return Colors.white;
//   //         //               },
//   //         //             ),
//   //         //           ),
//   //         //           child: Text(
//   //         //             "SORT BY",
//   //         //             style: TextStyle(color: Colors.black),
//   //         //           ),
//   //         //           onPressed: () {},
//   //         //         ),
//   //         //       ),
//   //         //     ),
//   //         //     Expanded(
//   //         //       child: Container(
//   //         //         height: 40,
//   //         //         padding: const EdgeInsets.only(right: 10, top: 8),
//   //         //         // width: _size.width,
//   //         //         child: ElevatedButton(
//   //         //           style: ButtonStyle(
//   //         //             backgroundColor:
//   //         //                 MaterialStateProperty.resolveWith<Color>(
//   //         //               (Set<MaterialState> states) {
//   //         //                 if (states.contains(MaterialState.pressed))
//   //         //                   return Color(0XFFF8F5F1);
//   //         //                 return Colors.white;
//   //         //               },
//   //         //             ),
//   //         //           ),
//   //         //           child: Text("FILTER BY",
//   //         //               style: TextStyle(
//   //         //                 color: Colors.black,
//   //         //               )),
//   //         //           onPressed: () {},
//   //         //         ),
//   //         //       ),
//   //         //     )
//   //         //   ],
//   //         // ),
//   //         SizedBox(
//   //           height: 10,
//   //         ),
//   //         Container(
//   //             padding: const EdgeInsets.all(3),
//   //             width: _size.width,
//   //             height: _size.height * 0.6,
//   //             color: Colors.transparent,
//   //             // color: Colors.white24,
//   //             // color: Color(0XFFF8F5F1),
//   //             child: Container(
//   //               // elevation: 2,
//   //               child: SingleChildScrollView(
//   //                 physics: NeverScrollableScrollPhysics(),
//   //                 child: Column(
//   //                   children: [
//   //                     Row(
//   //                       children: [
//   //                         Expanded(
//   //                           child: AspectRatio(
//   //                               aspectRatio: 16 / 9, child: Container()),
//   //                           // child: Container(
//   //                           //     // padding: const EdgeInsets.all(8),
//   //                           //     height: _size.height * 0.3,
//   //                           //     // width: _size.width * 0.93,
//   //                           //     decoration: new BoxDecoration(
//   //                           //       image: new DecorationImage(
//   //                           //         image: NetworkImage(
//   //                           //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.bandrbands.com%2Fimages%2Fproducts%2Fdetail%2F20mm-Cognac-Italian-Vintage-Leather-Nato-Watch-Band-Strap-Tudor-Blackbay-58-Watch.jpg&f=1&nofb=1'),
//   //                           //         fit: BoxFit.cover,
//   //                           //       ),
//   //                           //     )),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                     Row(
//   //                       mainAxisAlignment: MainAxisAlignment.start,
//   //                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                       children: [
//   //                         SizedBox(
//   //                           width: 10,
//   //                         ),
//   //                         CircleAvatar(
//   //                           radius: 18,
//   //                         ),
//   //                         Container(
//   //                           padding: const EdgeInsets.all(12.0),
//   //                           child: Text("username"),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                     Row(
//   //                       children: [
//   //                         Container(
//   //                             padding: const EdgeInsets.only(
//   //                               left: 12,
//   //                               top: 12,
//   //                             ),
//   //                             child: Text("Product :")),
//   //                         Container(
//   //                             padding: const EdgeInsets.only(left: 8, top: 12),
//   //                             child: Text(
//   //                               "Seiko Watch",
//   //                               softWrap: true,
//   //                               style: TextStyle(fontWeight: FontWeight.w700),
//   //                             ))
//   //                       ],
//   //                     ),
//   //                     Row(
//   //                       children: [
//   //                         Container(
//   //                             padding: const EdgeInsets.only(
//   //                               left: 12,
//   //                               top: 12,
//   //                             ),
//   //                             child: Text("Looking for:")),
//   //                         Expanded(
//   //                           child: Container(
//   //                               padding:
//   //                                   const EdgeInsets.only(left: 8, top: 12),
//   //                               child: Text(
//   //                                 "Graphic Designers",
//   //                                 softWrap: true,
//   //                                 style: TextStyle(fontWeight: FontWeight.w700),
//   //                               )),
//   //                         )
//   //                       ],
//   //                     ),
//   //                     Row(
//   //                       children: [
//   //                         Container(
//   //                             padding: const EdgeInsets.only(
//   //                               left: 12,
//   //                               top: 12,
//   //                             ),
//   //                             child: Text("Short Description :")),
//   //                         Container(
//   //                             padding: const EdgeInsets.only(left: 8, top: 12),
//   //                             child: Text(
//   //                               "Will work full time for 3 months ",
//   //                               softWrap: true,
//   //                               style: TextStyle(fontWeight: FontWeight.w700),
//   //                             ))
//   //                       ],
//   //                     ),
//   //                     SizedBox(height: 25),
//   //                     Row(
//   //                       mainAxisAlignment: MainAxisAlignment.center,
//   //                       crossAxisAlignment: CrossAxisAlignment.center,
//   //                       children: [
//   //                         Expanded(
//   //                           child: Container(
//   //                             padding: const EdgeInsets.symmetric(
//   //                                 vertical: 1, horizontal: 20),

//   //                             // width: _size.width,
//   //                             height: 35,
//   //                             child: ElevatedButton(
//   //                               style: ButtonStyle(
//   //                                 backgroundColor:
//   //                                     MaterialStateProperty.resolveWith<Color>(
//   //                                   (Set<MaterialState> states) {
//   //                                     if (states
//   //                                         .contains(MaterialState.pressed))
//   //                                       return Color(0XFF387c6d);
//   //                                     return Color(
//   //                                         0xffee6f57); // Use the component's default.
//   //                                   },
//   //                                 ),
//   //                               ),
//   //                               onPressed: () {
//   //                                 _openEndDrawer();
//   //                               },
//   //                               child: Text(
//   //                                 "View Details",
//   //                                 style: TextStyle(color: Colors.white),
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         )
//   //                       ],
//   //                     ),
//   //                     SizedBox(
//   //                       height: 18,
//   //                     ),
//   //                     // Row(
//   //                     //   children: [
//   //                     //     Expanded(
//   //                     //       child: Container(
//   //                     //           child: IconButton(
//   //                     //         icon: Icon(
//   //                     //           Icons.arrow_upward_sharp,
//   //                     //           size: 18,
//   //                     //         ),
//   //                     //       )),
//   //                     //     ),
//   //                     //     Expanded(
//   //                     //       child: Container(
//   //                     //           child: IconButton(
//   //                     //         icon: Icon(
//   //                     //           Icons.arrow_downward_sharp,
//   //                     //           size: 18,
//   //                     //         ),
//   //                     //       )),
//   //                     //     ),
//   //                     //     Expanded(
//   //                     //       child: Container(
//   //                     //           child: IconButton(
//   //                     //         icon: Icon(
//   //                     //           Icons.comment,
//   //                     //           size: 18,
//   //                     //         ),
//   //                     //       )),
//   //                     //     ),
//   //                     //   ],
//   //                     // )
//   //                   ],
//   //                 ),
//   //               ),
//   //             ))
//   //       ],
//   //     ),
//   //   );
//   //   //   endDrawer: Container(
//   //   //     width: _size.width,
//   //   //     child: Drawer(
//   //   //       child: ListView(
//   //   //         // Important: Remove any padding from the ListView.
//   //   //         padding: EdgeInsets.zero,
//   //   //         children: <Widget>[
//   //   //           Row(
//   //   //             mainAxisAlignment: MainAxisAlignment.end,
//   //   //             crossAxisAlignment: CrossAxisAlignment.end,
//   //   //             children: [
//   //   //               IconButton(
//   //   //                 onPressed: () {
//   //   //                   _closeEndDrawer();
//   //   //                 },
//   //   //                 icon: Icon(Icons.close),
//   //   //               )
//   //   //             ],
//   //   //           ),
//   //   //           ListTile(
//   //   //             title: Text('Item 1'),
//   //   //             onTap: () {},
//   //   //           ),
//   //   //           ListTile(
//   //   //             title: Text('Item 2'),
//   //   //             onTap: () {},
//   //   //           ),
//   //   //         ],
//   //   //       ),
//   //   //     ),
//   //   //   ),
//   //   // );
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return buildCards(context);
//   // }
// }
