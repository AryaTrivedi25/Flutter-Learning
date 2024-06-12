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

  var data = [
    {'name' : 'apple',
      'no':'7'
    },
    {'name' : 'bicycle',
        'no':'12'
    },
    {'name':'river',
        'no':'3'
    },
    {'name' : 'whisper',
        'no':'15'
    },
    {'name' : 'sunset',
        'no':'9'
    },
    {'name'  :'galaxy',
        'no':'18'
    },
    {'name' : 'emerald',
        'no':'5'
    },
    {'name' : 'laughter',
        'no' : '14'
    },
    {'name' : 'ocean',
        'no':'2'
    },
    {'name' : 'mountain',
        'no':'11'
    },
    {'name' : 'breeze',
        'no':'6'
    },
    {'name' : 'thunder',
        'no':'17'
    },
    {'name' : 'shadow',
        'no':'4'
    },
    {'name' : 'meadow',
        'no':'13'
    },
    {'name' : 'journey',
        'no':'8'
    },
    {'name' : 'harmony',
        'no':'16'
    },
    {'name' : 'crystal',
        'no':'1'
    },
    {'name' : 'phoenix',
        'no':'19'
    },
    {'name' : 'solitude',
        'no':'10'
    },
    {'name' : 'horizon',
        'no':'20'
    }];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: data.map((value)=>ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(value['name'].toString(), style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
            subtitle: Text(value['no'].toString()),

          )).toList(),
        ),
      )

    );
  }
}
