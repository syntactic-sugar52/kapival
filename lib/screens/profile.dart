import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  buildProfile() {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0XFFF8F5F1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    radius: 60.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sbuns Luna",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Belgaum, India",
              //   style: TextStyle(
              //       fontSize: 18.0,
              //       color: Colors.black45,
              //       letterSpacing: 2.0,
              //       fontWeight: FontWeight.w300),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "App Developer at XYZ Company",
              //   style: TextStyle(
              //       fontSize: 15.0,
              //       color: Colors.black45,
              //       letterSpacing: 2.0,
              //       fontWeight: FontWeight.w300),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Card(
              //     margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              //     elevation: 2.0,
              //     child: Padding(
              //         padding:
              //             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              //         child: Text(
              //           "Skill Sets",
              //           style: TextStyle(
              //               letterSpacing: 2.0, fontWeight: FontWeight.w300),
              //         ))),
              SizedBox(
                height: 15,
              ),
              Text(
                "App Developer || Digital Marketer",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black45,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400),
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
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      SizedBox(
                        width: 1,
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
                              "2000",
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
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Following",
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
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Follow"), Text("Message")],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // height: double.infinity,

                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 3,
                    // decoration: BoxDecoration(border: ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Padding(
                        //   padding: EdgeInsets.only(top: 2),
                        // ),
                        Container(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.peltzshoes.com%2Fimages%2Fproducts%2F1_661952_ZM_1.jpg&f=1&nofb=1"),
                            ),
                            height: 170
                            // MediaQuery.of(context).size.height,
                            ),
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
                        Text("For: Developers",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .apply(fontSizeFactor: 0.8)),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                        ),
                        ElevatedButton(
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
                  Container(
                    // height: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 3,
                    // decoration: BoxDecoration(border: ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Padding(
                        //   padding: EdgeInsets.only(top: 2),
                        // ),
                        Container(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.peltzshoes.com%2Fimages%2Fproducts%2F1_661952_ZM_1.jpg&f=1&nofb=1"),
                            ),
                            height: 170
                            // MediaQuery.of(context).size.height,
                            ),
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
                        Text("For: SALE",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .apply(fontSizeFactor: 0.8)),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                        ),
                        ElevatedButton(
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
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //         color: Colors.transparent,
              //       ),
              //       height: MediaQuery.of(context).size.height / 3,
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Expanded(
              //             child: Container(
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.all(Radius.circular(8))),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: [
              //                   Container(
              //                     padding: const EdgeInsets.all(10),
              //                     alignment: Alignment.topLeft,
              //                     child: CircleAvatar(
              //                       radius: 38,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               // color: Colors.green,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Container(
              //             padding: const EdgeInsets.only(right: 10),
              //             // alignment: Alignment.topCenter,
              //             child: Text(
              //               "hello",
              //               textAlign: TextAlign.center,
              //             )),
              //       ],
              //     ),
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
