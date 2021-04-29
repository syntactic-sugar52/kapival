import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kap/models/user_model/user_model.dart';
import 'package:kap/services/database.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      searchResultsFuture = null;
    });
  }

  handleSearch(String query) {
    Future<QuerySnapshot> users =
        usersRef.where("first_name", isGreaterThanOrEqualTo: query).get();
    setState(() {
      searchResultsFuture = users;
    });
  }

  Widget get search => SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    height: 100,
                    child: TextField(
                        cursorColor: Colors.grey.shade400,
                        controller: _searchController,
                        decoration: new InputDecoration(
                          hintText: 'Search ...',
                          contentPadding: EdgeInsets.all(10.0),
                          suffixIcon: IconButton(
                            onPressed: _clearSearch,
                            icon: Icon(Icons.clear),
                            color: Colors.black54,
                            // color: Color(0xffee6f57),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onSubmitted: (input) {
                          if (input.isNotEmpty) {
                            handleSearch(input);
                          }
                        }),
                  ),
                )
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFf6f5f5),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search,
            SizedBox(
              height: 20,
            ),
            searchResultsFuture == null
                ? Container()
                : FutureBuilder(
                    future: searchResultsFuture,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // if (snapshot.data.documents.length == 0) {
                      //   return Center(
                      //     child: Text('No users found! Please try again.'),
                      //   );
                      // }
                      List<UserResult> search = [];
                      snapshot.data.docs.forEach((doc) {
                        UserModel user = UserModel.fromDocumentSnapshot(doc);
                        UserResult result = UserResult(
                          user: user,
                        );
                        search.add(result);
                      });

                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Top Result :",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView(
                              children: search,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  final UserModel user;
  UserResult({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.profilePhoto),
          ),
          title: Text(user.firstName + " " + user.lastName),
          // subtitle: Text(user.userName),
        ),
        Divider(
          color: Colors.grey,
          height: 2,
        )
      ],
    ));
  }
}
