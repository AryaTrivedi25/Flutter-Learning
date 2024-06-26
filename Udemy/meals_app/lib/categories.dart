import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pick your category !", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),),
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),),
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),),
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),),
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),),
          Text("1\n2\n3\n4\n5", style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }

}