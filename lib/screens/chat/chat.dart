import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_controller.dart';

class Chat extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Direct Message",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w600))),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: CircleAvatar(),
                            tileColor: Colors.transparent,
                            title: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Text("Andrea Villanueva")),
                            trailing: Wrap(children: [
                              // Text("hello, how are you? "),

                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )),
                              // SizedBox(
                              //   width: 3,
                              // ),
                            ]),
                          ),
                          ListTile(
                            leading: CircleAvatar(),
                            tileColor: Colors.transparent,
                            title: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Text(
                              "Kd Ang",
                              style: GoogleFonts.roboto(fontSize: 14),
                            )),
                            trailing: Wrap(children: [
                              // Text("hello, how are you? "),

                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )),
                              // SizedBox(
                              //   width: 3,
                              // ),
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
