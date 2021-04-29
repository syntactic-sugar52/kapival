import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';

class HomeState extends StatefulWidget {
  final String url;
  final List files;
  HomeState({this.url, this.files});

  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState>
    with SingleTickerProviderStateMixin {
  final isSwitched = false;
  String videFile;
  TextEditingController _searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 6, vsync: this);
    super.initState();
  }

  Widget get menu => Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity - 40,
            height: 200,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(18),
              crossAxisSpacing: 20,
              scrollDirection: Axis.horizontal,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 200,
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons8-product-100.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Stack(children: [
                  Container(
                    height: 100,
                    width: 300,
                    // padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons8-strength-100.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    // child: ,
                  ),
                  Text("sports"),
                ]),
                Container(
                  height: 100,
                  width: 400,
                  // padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.teal[300],
                ),
                Container(
                  height: 100,
                  width: 400,
                  // padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.teal[400],
                ),
                Container(
                  height: 100,
                  width: 400,
                  // padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.teal[300],
                ),
                Container(
                  height: 100,
                  width: 400,
                  // padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.teal[400],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );

  Widget buildCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      // margin: const EdgeInsets.only(left: 5, right: 5),
      // margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmedia.istockphoto.com%2Fphotos%2Fback-view-of-modern-programmer-sitting-and-writing-code-picture-id508417878%3Fk%3D6%26m%3D508417878%26s%3D612x612%26w%3D0%26h%3DU_7Zyd5CMopBFqwvm2oG2mAOMOcl-4SJEG-uStQLEUU%3D&f=1&nofb=1',
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 12.0,
            ),
            child: Column(
              children: [
                Text(
                  "SERVICE",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.9,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Mobile Developer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.9,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Looking for",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "By who",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 155,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 23,
                                  ),
                                  Text("Hello, ${_user.currentUser.firstName}!",
                                      softWrap: true,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700)),
                                  Text("add cover photo")
                                ],
                              ),
                            ],
                          ),
                          color: Colors.greenAccent,
                          // color: Color(0XFF008891),
                          // color: Colors.greenAccent
                          // color: Colors.amberAccent,
                          // color: Color(0XFFEFEE81)
                        )),
                    Positioned(
                        top: 128.0,
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width - 40,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 2)
                              ]),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(
                                Icons.search_outlined,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: () {},
                            ),
                            title: Container(
                              height: 50,
                              width: 60,
                              padding: const EdgeInsets.only(top: 14),
                              child: TextField(
                                cursorColor: Colors.grey,
                                controller: _searchController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration.collapsed(
                                  hintText: "What are you looking for?",
                                  // hintTextDirection: ,
                                  hintStyle: GoogleFonts.roboto(
                                      color: Colors.grey.shade400),

                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 210.0,
                        // bottom: 100,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 320,
                          child: Column(children: [
                            TabBar(
                              isScrollable: true,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.black,
                              // indicatorColor: Colors.indigo,
                              // indicatorPadding: const EdgeInsets.only(top: 15),
                              indicatorColor: Colors.blueGrey,
                              tabs: [
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                  size: 24,
                                  // color: Color(0XFFEFEE81),
                                  // color: Color(0XFF229399),
                                  // color: Colors.indigoAccent,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Service",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Referral",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Investment",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "Information",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.label,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              // height: MediaQuery.of(context).size.height / 43,
                              child: TabBarView(
                                children: [
                                  menu,
                                  Text('Person'),
                                  Text('Person'),
                                  Text('Person'),
                                  Text('Person'),
                                  Text('Person')
                                ],
                                controller: _tabController,
                              ),
                            ),
                          ]),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 4),
                child: buildCard(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 4),
                child: buildCard(),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
