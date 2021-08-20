import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'nearby_interface.dart';
import 'registration.dart';
import 'welcome_screen.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _auth = FirebaseAuth.instance;
  var count = 0;
  String checkSignedIn(){
    var user = _auth.currentUser();
    if(user!=null) return NearbyInterface.id;
    else return WelcomeScreen.id;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: checkSignedIn(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        NearbyInterface.id: (context) => NearbyInterface(),
      },
    );
  }
}
