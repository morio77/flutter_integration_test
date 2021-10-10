import 'package:flutter/material.dart';
import 'package:flutter_integration_test/list_view.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = 'MyHomePage';
  const MyHomePage({Key? key}) : super(key: key);

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
        title: const Text('integration test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // カウンター部分
            Text(
              '$_counter',
              key: const Key('countText'),
              style: Theme.of(context).textTheme.headline4,
            ),

            // ページ移動ボタン部分
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ListViewPage.routeName),
              child: const Text('ListViewページへ移動'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('button'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
