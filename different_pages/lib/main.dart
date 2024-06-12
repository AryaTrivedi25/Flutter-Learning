import 'package:different_pages/IntroPage.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Intropage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, this.dummy});
  final String title;
  var dummy;

  @override
  State<MyHomePage> createState(){
    return _MyHomePageState(dummy);
  }
}

class _MyHomePageState extends State<MyHomePage>  {
  int _counter = 0;
  _MyHomePageState(this.nameText);
  var nameText;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Text("Hello Home Page.!! $nameText", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          ),

        ],
      )
    );
  }
}
