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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          shadowColor: Colors.black,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 7),
                                height: 300,
                                width: 300,
                                color: Colors.blueAccent,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 7),
                                height: 300,
                                width: 300,
                                color: Colors.indigo,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 7),
                                height: 300,
                                width: 300,
                                color: Colors.brown,
                              ),
                            ],
                          ),
                        ),
                      ),
                  Container(
                    margin: EdgeInsets.only(bottom: 11),
                    height: 300,
                    //width: 300,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 11),
                    height: 300,
                    //width: 300,
                    color: Colors.purpleAccent,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 11),
                    height: 300,
                    //width: 300,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
