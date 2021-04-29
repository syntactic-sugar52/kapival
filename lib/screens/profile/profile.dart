import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kap/models/information_model.dart';
// import 'package:kap/screens/profile/profile_controller.dart';
import 'package:kap/screens/provider/information_provider.dart';
import 'package:kap/services/database.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:cached_video_player/cached_video_player.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CachedVideoPlayerController controller;
  String mediaUrl;

  var data;

  buildProfile() {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0XFFF8F5F1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // width: double.infinity,
                    height: 53,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        radius: 60.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    _user.currentUser.firstName +
                        " " +
                        _user.currentUser.lastName,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                    child: Text("Follow"),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "bio ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Cards",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   // width: MediaQuery.of(context).size.width,
                      //   height: 50,
                      //   child: VerticalDivider(
                      //     color: Colors.grey,
                      //     width: 1,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 1,
                      // ),
                      // Expanded(
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         "Followers",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 16.0,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       SizedBox(
                      //         height: 7,
                      //       ),
                      //       Text(
                      //         "2000",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 18.0,
                      //             fontWeight: FontWeight.w300),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Followers",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Deals",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Divider(
              //   color: Colors.grey,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [Text("Follow"), Text("Message")],
              // ),
              // Divider(
              //   color: Colors.grey,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Center(
                  //     child: controller.value != null &&
                  //             controller.value.initialized
                  //         ? AspectRatio(
                  //             child: CachedVideoPlayer(controller),
                  //             aspectRatio: controller.value.aspectRatio,
                  //           )
                  //         : Center(
                  //             child: CircularProgressIndicator(),
                  //           )),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // ListView.builder(itemBuilder: )
                        Container(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.peltzshoes.com%2Fimages%2Fproducts%2F1_661952_ZM_1.jpg&f=1&nofb=1"),
                            ),
                            height: 170),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text("Addidas Shoes",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          "For: Developers",
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("View More"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.peltzshoes.com%2Fimages%2Fproducts%2F1_661952_ZM_1.jpg&f=1&nofb=1"),
                            ),
                            height: 170),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text("Addidas Shoes",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(fontSize: 16)
                            // Theme.of(context)
                            // .textTheme
                            // .title
                            // .apply(fontSizeFactor: 0.7),
                            ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text(
                          "For: SALE",
                          textAlign: TextAlign.center,
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .subhead
                          //     .apply(fontSizeFactor: 0.8)
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("View More"),
                        )
                        // Text("Add to Cart",
                        //     // this.isInCart ? "In Cart" : item.formattedAvailability,
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.caption.apply(
                        //         fontSizeFactor: 0.8, color: Colors.black
                        //         // isInCart ? Colors.blue : item.availabilityColor
                        //         )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildProfile();
  }
}
