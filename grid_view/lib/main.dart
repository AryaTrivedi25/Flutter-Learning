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
      home: const MyHomePage(title: 'Flutter Demo Grid View'),
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
    var arrColors = [Colors.blueAccent,
      Colors.black,
      Colors.brown,
      Colors.green,
      Colors.red,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.orange
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      // Column(
      //   children: [
      //     Container(
      //       height: 200,
      //       width: 200,
      //       child: GridView.count(crossAxisCount: 4,
      //         crossAxisSpacing: 8,
      //         mainAxisSpacing: 8,
      //         children: [
      //           Container(color: arrColors[1],),
      //           Container(color: arrColors[2],),
      //           Container(color: arrColors[3],),
      //           Container(color: arrColors[4],),
      //           Container(color: arrColors[5],),
      //           Container(color: arrColors[6],),
      //           Container(color: arrColors[7],),
      //           Container(color: arrColors[0],),
      //           Container(color: arrColors[1],),
      //           Container(color: arrColors[2],),
      //           Container(color: arrColors[3],),
      //           Container(color: arrColors[4],),
      //           Container(color: arrColors[5],),
      //           Container(color: arrColors[6],),
      //           Container(color: arrColors[7],),
      //           Container(color: arrColors[0],)
      //         ],
      //       ),
      //     ),
      //     Container(
      //       height: 100,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 200,
      //       child: GridView.extent(maxCrossAxisExtent: 100,
      //         crossAxisSpacing: 8,
      //         mainAxisSpacing: 8,
      //         children: [
      //           Container(color: arrColors[1],),
      //           Container(color: arrColors[2],),
      //           Container(color: arrColors[3],),
      //           Container(color: arrColors[4],),
      //           Container(color: arrColors[5],),
      //           Container(color: arrColors[6],),
      //           Container(color: arrColors[7],),
      //           Container(color: arrColors[0],),
      //           Container(color: arrColors[1],),
      //           Container(color: arrColors[2],),
      //           Container(color: arrColors[3],),
      //           Container(color: arrColors[4],),
      //           Container(color: arrColors[5],),
      //           Container(color: arrColors[6],),
      //           Container(color: arrColors[7],),
      //           Container(color: arrColors[0],)
      //         ],
      //       ),
      //     )
      //   ],
      // )
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8),
        itemBuilder: (context, index){
        return Container(color: arrColors[index],);
      },
        itemCount: arrColors.length,
      )
      
    );
  }
}
