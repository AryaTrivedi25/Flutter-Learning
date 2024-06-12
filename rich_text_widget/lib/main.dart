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
      home: const MyHomePage(title: 'Flutter Rich Text'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 23,
            ),
            children: <TextSpan>[
              TextSpan(text: "Hello "),
              TextSpan(text: "World", style: TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              )),
              TextSpan(text: " Welcome To "),
              TextSpan(text: "Flutter", style: TextStyle(
                fontSize: 32,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
                fontFamily: "myFont",

              ))
            ]
          ),
        ),
      )

    );
  }
}
