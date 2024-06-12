
import 'dart:convert';

import 'details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_page/home_page.dart';
import 'package:splash_page/main.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
    => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

  late SharedPreferences sp;

  List<Details> ldetails = [];

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController mo = TextEditingController();
  TextEditingController desig = TextEditingController();
  TextEditingController name = TextEditingController();

  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passController = TextEditingController();
  // TextEditingController


  List<String>? RdetailListString = [];

  getSharedPreferences () async{
    sp = await SharedPreferences.getInstance();
    readFromSp();
  }

  readFromSp() async{
    sp = await SharedPreferences.getInstance();
    RdetailListString = sp.getStringList("myData");
    print('DATA on login is:$RdetailListString');
    if(RdetailListString != null){
      ldetails = RdetailListString!.map((det) => Details.fromJson(jsonDecode(det))).toList();
      String? name = ldetails[0].name;
    }
    setState(() {
    });
  }

  saveIntoSp(){
    List<String> WdetailListString = ldetails.map((det) => jsonEncode(det.toJson())).toList();
    sp.setStringList("myData", WdetailListString);
  }

  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, color: Colors.blue, size: 100,),
              SizedBox.square(dimension: 30,),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'Name',
                  hintText: 'Enter Your Names',
                ),
              ),
              SizedBox.square(dimension: 30,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'E-mail',
                  hintText: 'Enter Your E-mail',
                ),
              ),
              SizedBox.square(dimension: 30,),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                ),
              ),
              SizedBox.square(dimension: 30,),
              TextField(
                controller: desig,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'Designation',
                  hintText: 'Enter Your Designation',
                ),
              ),
              SizedBox.square(dimension: 30,),
              TextField(
                keyboardType: TextInputType.phone,
                controller: mo,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Mobile Number',
                ),
              ),
              SizedBox.square(dimension: 30,),
              ElevatedButton(onPressed: () async {

                String sName = name.text.trim();
                String sEmail = email.text.trim();
                String sPass = pass.text.trim();
                String sDesig = desig.text.trim();
                String sMo = mo.text.trim();

                setState(() {
                  ldetails.add(Details(name: sName,
                      email: sEmail,
                      pass: sPass,
                      desig: sDesig,
                      mo: sMo));
                });
                print('inner side');
                print("List data is:${ldetails[0].name}");
                sp = await SharedPreferences.getInstance();
                saveIntoSp();

                // if(sEmail.isNotEmpty && sPass.isEmpty) {
                //
                //   // print(ldetails.name)
                // }
                print('outer side');
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashPageState.LOGINKEY, true);

                Navigator.of(context).pushAndRemoveUntil(
                  // Route to push onto the navigation stack
                  MaterialPageRoute(builder: (context) => homePage()),
                  // Predicate to determine when to stop removing routes
                      (Route<dynamic> route) => route is homePage, // Stop at MyHomePage
                );
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
