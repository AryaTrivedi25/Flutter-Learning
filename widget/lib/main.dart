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
      home: const MyHomePage(title: 'Flutter Demo Widget Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [CatItems(), CatNames(), CatImages()],
      )

    );
  }
}

class CatItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 2,
      child: Container(
        color: Colors.black,
        child: ListView.builder(itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                child: CircleAvatar(backgroundColor: Colors.white, radius: 63,)),
          );
        },
            itemCount: 10,
            scrollDirection: Axis.horizontal),
      ),
    );
  }
}

class CatNames extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 4,
      child: Container(
        color: Colors.blueAccent,
        child: ListView.builder(itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow,),
              title: Text("Name"),
              subtitle: Text("Mobile no."),
              trailing: Icon(Icons.delete),
            ),
          );
        },
          itemCount: 10,
        ),
      ),
    );
  }
}

class CatImages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.red,
        child: ListView.builder(itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.deepPurpleAccent,),),
          );
        }, itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),

      ),
    );
  }
}