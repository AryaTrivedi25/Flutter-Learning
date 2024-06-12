import 'package:different_pages/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intropage extends StatelessWidget{

  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intro Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            const Text("Welcome", style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox.square(
              dimension: 11,
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter any Text"
                ),

              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MyHomePage(title: "Home Page",dummy: nameController.text.toString(),);
                  }

                  )
              );
            }, child: const Text("Click to go to Home Page")),
          ],
        ),
      ),
    );
  }

}