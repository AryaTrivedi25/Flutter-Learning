import 'package:circle_avatar/ui_helper/util.dart';
import 'package:flutter/material.dart';
// import 'package:FlutterProjects/circle_avatar/lib/ui_helper/util.dart';

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
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)
        )
      ),
      home: const MyHomePage(title: 'Flutter Demo Circle Avatar'),
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
        child: Column(
          children: [
            Text("Arya Trivedi", style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.pink)),
            Text("Arya Trivedi", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.green)),
            Text("Arya Trivedi", style: Theme.of(context).textTheme.displayLarge!.copyWith(color : Colors.blue)),
            Text("Arya Trivedi11", style: myTextStyle11()),
            Container(
              height: 300,
              width: 300,
              child: CircleAvatar(
                backgroundImage: AssetImage('Assets/Images/_M6A7908.JPG'),
              ),
            ),
          ]

        )

      )
        );
  }
}
