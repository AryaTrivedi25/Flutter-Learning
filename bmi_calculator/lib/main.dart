
import 'dart:core';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var weight = TextEditingController();
  var height = TextEditingController();
  var bmi = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 300,
          color: Colors.white12,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  keyboardType: TextInputType.number,
                  controller: weight,
                  decoration: InputDecoration(
                    hintText: "Enter your Weight in kgs",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1
                      ),
                    ),
                  ),
                ),
                SizedBox.square(
                  dimension: 50,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: height,
                  decoration: InputDecoration(
                    hintText: "Enter your Height in meters",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1
                      ),
                    ),
                    )
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: (){


                    setState(() {
                      var w = double.parse(weight.text.toString());
                      var h = double.parse(height.text.toString());
                      var ans = w/(h*h);
                      bmi = "BMI : ${ans.toStringAsFixed(2)}";

                    });
                  },
                      child: Text("Click to get BMI")),
                ),
                SizedBox(
                  child: Text(bmi,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),

              ],

            ),
          ),

        ),
      )

    );
  }
}
