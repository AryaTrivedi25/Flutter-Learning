import 'dart:ui';

import 'package:animated_container/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animated page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var _height = 200.0;
  var _width = 100.0;
  var _myOp = 1.0;

  BoxDecoration _myDecor = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(25),
  );

  bool flag = true;
  bool flag1 = true;
  bool flag2 = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: _width,
              height: _height,
              decoration: _myDecor,
              curve: Curves.bounceOut,
            ),
            SizedBox.square(
              dimension: 10,
            ),
            ElevatedButton(onPressed: (){
              if(flag){
                _width = 200.0;
                _height = 100.0;
                _myDecor = BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                );
                flag = false;
              }
              else{
                _width = 200.0;
                _height = 200.0;
                _myDecor = BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                );
                flag = true;
              }
              setState(() {

              });
            }, child: Text("Click to change..!")),
            SizedBox.square(
              dimension: 10,
            ),
            AnimatedOpacity(opacity: _myOp, duration: Duration(seconds: 1),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.orange,
            ),),
            SizedBox.square(
              dimension: 10,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if(flag1){
                  _myOp = 0.0;
                  flag1 = false;
                }
                else{
                  _myOp = 1.0;
                  flag1 = true;
                }
              });
            }, child: Text("Change Opacity")),
            SizedBox.square(
              dimension: 10,
            ),
            Container(
              height: 200,
              width: 200,
              child: AnimatedCrossFade(firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.blueGrey.shade400,
              ),
                  sizeCurve: Curves.slowMiddle,
                  firstCurve: Curves.bounceOut,
                  secondCurve: Curves.ease,
                  secondChild: InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return detail_page();
                      }));
                    },
    child: Hero(
    tag: "Background",
    child: Image.asset('assets/images/_M6A7925.JPG')),
    ),
    crossFadeState: flag2 ? CrossFadeState.showFirst :CrossFadeState.showSecond,
    duration: Duration(seconds: 2)),
    ),
    SizedBox.square(
    dimension: 10,
    ),
    ElevatedButton(onPressed: (){
    if(flag2){
    flag2 = false;
    }
    else{
    flag2 = true;
    }
    setState(() {

    });
    }, child: Text("Photo"))
    ],
    ),
    )

    );
    }
  }

