import 'package:flutter/material.dart';
import 'package:flutter_integration_test/home.dart';
import 'package:flutter_integration_test/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integration Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MyHomePage.routeName: (_) => const MyHomePage(),
        ListViewPage.routeName: (_) => const ListViewPage(),
      },
      initialRoute: MyHomePage.routeName,
    );
  }
}
