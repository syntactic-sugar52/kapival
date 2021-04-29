import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kap/auth/create_profile.dart';
import 'package:kap/auth/welcome_screen.dart';

import 'package:kap/states/current_user.dart';
import 'package:kap/states/user_auth.dart';

import 'package:provider/provider.dart';
import 'root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserAuth>(create: (_) => UserAuth()),
          ChangeNotifierProvider<CurrentUser>(create: (_) => CurrentUser()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Root(),
        ));
  }
}
