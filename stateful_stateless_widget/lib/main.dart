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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }

}

class MyHomeState extends State<MyHomePage>{

  var count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Count : $count", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    count++;
                    print("$count");
                  });
                },
                child: Text("Increment", style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),

    );
  }

}


