import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var arrIndex = [1,2,3,4,5,6,7,8,9,10,11];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.black
            ]
          )
        ),

        child: ListWheelScrollView(
          itemExtent: 100,
          children:
            arrIndex.map((value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(child: Text("$value", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color : Colors.blue,
                  borderRadius: BorderRadius.circular(20)


                ),
              ),
            )).toList(),
        ),
      )
    );
  }
}
