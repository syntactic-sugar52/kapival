import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../states/current_user.dart';

class Cards extends StatefulWidget {
  final Function pressed;
  Cards({this.pressed});
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  buildCards(context) {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 10, top: 8),
                    // width: _size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Color(0XFFF8F5F1);
                            return Colors.white;
                          },
                        ),
                      ),
                      child: Text(
                        "SORT BY",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(right: 10, top: 8),
                    // width: _size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Color(0XFFF8F5F1);
                            return Colors.white;
                          },
                        ),
                      ),
                      child: Text("FILTER BY",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(10),
                width: _size.width,
                height: _size.height * 0.7,
                child: Card(
                  elevation: 5,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  // padding: const EdgeInsets.all(8),
                                  height: _size.height * 0.3,
                                  // width: _size.width * 0.93,
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                      image: NetworkImage(
                                          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.bandrbands.com%2Fimages%2Fproducts%2Fdetail%2F20mm-Cognac-Italian-Vintage-Leather-Nato-Watch-Band-Strap-Tudor-Blackbay-58-Watch.jpg&f=1&nofb=1'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(_user.getEmail),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 12,
                                ),
                                child: Text("Product :")),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 12),
                                child: Text(
                                  "Seiko Watch",
                                  softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 12,
                                ),
                                child: Text("Looking for:")),
                            Expanded(
                              child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 12),
                                  child: Text(
                                    "Graphic Designers",
                                    softWrap: true,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 12,
                                ),
                                child: Text("Short Description :")),
                            Expanded(
                              child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 12),
                                  child: Text(
                                    "Will work full time for 3 months",
                                    softWrap: true,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(height: 33),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 20),

                                // width: _size.width,
                                height: 55,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Colors.green;
                                        return Color(
                                            0xffee6f57); // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    _openEndDrawer();
                                  },
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                child: IconButton(
                              icon: Icon(Icons.arrow_upward_sharp),
                            )),
                            Container(
                                child: IconButton(
                              icon: Icon(Icons.arrow_downward_sharp),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      endDrawer: Container(
        width: _size.width,
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
                      _closeEndDrawer();
                    },
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCards(context);
  }
}
