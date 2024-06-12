import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_page/main.dart';


class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context){
        return MyHomePage(title: "Home Page");
      }));
    
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: const Center(
          child: Text("Welcome to Splash", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
        ),
      ),
    );
  }
}