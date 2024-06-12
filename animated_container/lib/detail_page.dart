import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detail_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail_Page"),
      ),
      body: Container(
        child: Hero(
          tag: "background",
          child: Image.asset('assets/images/_M6A7925.JPG'),
        ),
      ),
    );
  }

}