import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_page/home_page.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  static const String LOGINKEY = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Icon(Icons.account_circle, color: Colors.white, size: 35,),
        ),
      )

    );
  }

  Future<void> whereToGo() async {

    var shredPref = await SharedPreferences.getInstance();
    var isLoggedIn = shredPref.getBool(LOGINKEY);

    Timer(Duration(seconds: 2), () {

      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return homePage();
              }));
        }
        else{
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
        }
      }
      else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
      }


    });
  }
}

