import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class _AppState extends State<App> {
  int _counter = 0;
  void incrementCnt() {
    setState(() {
      _counter++;
    });
  }

  String defVal = 'One';
  List<String> numbers = [
    'One',
    'Two',
    'Three',
  ];

  List<DropdownMenuItem<String>> converter() {
    List<DropdownMenuItem<String>> res = [];
    for (var item in numbers) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );

      res.add(newItem);
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('You pressed buttons $_counter times'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: incrementCnt,
              child: const Text('Click Text Button'),
            ),
            ElevatedButton(
              onPressed: incrementCnt,
              child: const Text('Click Elevated Button'),
            ),
            FloatingActionButton(
              child: const Text('+'),
              onPressed: incrementCnt,
            ),
            DropdownButton<String>(
              value: defVal,
              items: converter(),
              onChanged: (String? newValue) {
                setState(() {
                  defVal = newValue!;
                });
              },
            ),
            IconButton(
              onPressed: incrementCnt,
              icon: const Icon(Icons.cloud),
            ),
            InkWell(
              onTap: incrementCnt,
              child: Container(
                width: 100,
                padding: EdgeInsets.all(30),
                color: Colors.green,
                child: const Text('zxc'),
              ),
            ),
            OutlinedButton(
              onPressed: incrementCnt,
              child: const Text('Click Text Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}
