import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_page/details.dart';
import 'package:splash_page/login_page.dart';

class homePage extends StatefulWidget {

  homePage();

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  _homePageState();

  late SharedPreferences sp;


  List<Details> ldetails = [];
  List<String>? RdetailListString = [];

  getSharedPreferences () async{
    sp = await SharedPreferences.getInstance();
    readFromSp();
  }
  saveIntoSp(){
    List<String> WdetailListString = ldetails.map((det) => jsonEncode(det.toJson())).toList();
    sp.setStringList("myData", WdetailListString);
  }

  readFromSp() async{
    sp = await SharedPreferences.getInstance();
    RdetailListString = sp.getStringList("myData");
    print('DATA is:$RdetailListString');
    if(RdetailListString != null){
      ldetails = RdetailListString!.map((det) => Details.fromJson(jsonDecode(det))).toList();
      String? name = ldetails[0].name;
    }
    setState(() {
    });
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
        title: Center(child: Text("Home Page", style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{
                sp = await SharedPreferences.getInstance();
                List<String> newData = RdetailListString ?? [];
                sp.setStringList('myData',newData);
                print('DATA onClick is:$newData');
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return LoginPage();
                }));
              },
                  child: Text("Add")),
              ldetails.isEmpty ? Text("No data available.!") :
              Expanded(
                child: ListView.builder(
                  itemCount: ldetails.length,
                  itemBuilder: (context, index){
                    return getWid(index);
                  }),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget getWid(int index) {
    return Card(
      child: ListTile(
        title: Container(
          margin: EdgeInsets.all(7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : ${ldetails[index].name}"),
                  Text("E-mail : ${ldetails[index].email}"),
                  Text("Designation : ${ldetails[index].desig}"),
                  Text("Mobile number : ${ldetails[index].mo}"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    TextEditingController newName = TextEditingController(text: ldetails[index].name);
                    TextEditingController newEmail = TextEditingController(text: ldetails[index].email);
                    TextEditingController newDesignation = TextEditingController(text: ldetails[index].desig);
                    TextEditingController newMo = TextEditingController(text: ldetails[index].mo);
                    showDialog(context: context, builder: (context){
                      return Container(
                        child: AlertDialog(
                          title: Text("Edit Fileds"),
                          backgroundColor: Colors.blueGrey.shade100,
                          actions: [
                            Container(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: newName,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        labelText: 'Name',
                                        hintText: 'Enter Your Name',
                                      ),
                                    ),
                                    SizedBox.square(dimension: 15),
                                    TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: newEmail,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        labelText: 'E-mail',
                                        hintText: 'Enter Your E-mail',
                                      ),
                                    ),
                                    SizedBox.square(dimension: 15),
                                    TextField(
                                      controller: newDesignation,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        labelText: 'Designation',
                                        hintText: 'Enter Your Designation',
                                      ),
                                    ),
                                    SizedBox.square(dimension: 15,),
                                    TextField(
                                      keyboardType: TextInputType.phone,
                                      controller: newMo,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        labelText: 'Mobile Number',
                                        hintText: 'Enter Your Mobile Number',
                                      ),
                                    ),
                                    SizedBox.square(dimension: 15),
                                    TextButton(onPressed: (){

                                      String sName = newName.text.trim();
                                      String sEmail = newEmail.text.trim();
                                      String sDesig = newDesignation.text.trim();
                                      String sMo = newMo.text.trim();

                                      ldetails[index].name = sName;
                                      ldetails[index].email = sEmail;
                                      ldetails[index].desig = sDesig ;
                                      ldetails[index].mo = sMo;
                                      setState(() {
                                      });

                                      Navigator.pop(context);

                                    }, child: Text("save")),
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("cancel"))
                                  ],
                                ),


                            )

                          ],
                        ),
                      );
                    });
                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){
                    setState(() async {
                      ldetails.removeAt(index);
                      getSharedPreferences();
                      saveIntoSp();
                      setState(() {

                      });
                    });
                  }, icon: Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}