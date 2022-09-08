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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _l = 0;
  String _operator = '';
  int _r = 0;
  int _result = 0;

  void _setNum(int input) {
    setState(() {
      if (_operator == '') {
        _l = input;
      } else {
        _r = input;
      }
    });
  }

  void _setOperator(String op) {
    setState(() {
      _operator = op;
    });
  }

  void _executeCalc() {
    setState(() {
      switch (_operator) {
        case '+':
          _result = _l + _r;
          break;
        case '-':
          _result = _l - _r;
          break;
        case '/':
          _result = _l ~/ _r;
          break;
        case '*':
          _result = _l * _r;
          break;
        default:
      }
    });
  }

  void _clear() {
    setState(() {
      _l = 0;
      _operator = '';
      _r = 0;
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_l $_operator $_r = $_result',
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _clear,
                  child: const Text('clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperator('+');
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperator('-');
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperator('*');
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperator('/');
                  },
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: _executeCalc,
                  child: const Text('='),
                ),
              ],
            ),
            Table(
                children: List.generate(
                    3,
                    (l) => TableRow(
                        children: List.generate(
                            3,
                            (r) => ElevatedButton(
                                  onPressed: () {
                                    _setNum(3 * l + r + 1);
                                  },
                                  child: Text('${3 * l + r + 1}'),
                                ))))),

            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Flexible(
            //       child: ListView.builder(
            //         itemCount: 9,
            //         itemBuilder: (BuildContext context, int index) {
            //           return (Text("リストNo, $index"));
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // Text("リストNo"),
            // FloatingActionButton(
            //   onPressed: _incrementCounter,
            //   tooltip: 'Increment',
            //   child: const Icon(Icons.add),
            // ),
            // FloatingActionButton(
            //   onPressed: _reset,
            //   tooltip: 'reset',
            //   child: const Icon(Icons.weekend),
            // ),
          ],
        ),
      ),
    );
  }
}
