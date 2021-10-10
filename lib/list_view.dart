import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  static const routeName = 'ListViewPage';
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var _itemCount = 0;
  final _titleList = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView test'),
      ),
      body: ListView.builder(
        itemCount: _titleList.length,
        itemBuilder: (BuildContext context, int index) {
          return _titleList[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('floatingActionButton'),
        onPressed: () {
          setState(() {
            _itemCount++;
            _titleList.add(_listItem(_itemCount.toString()));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _listItem(String title) {
  return ListTile(
    leading: const Icon(Icons.people),
    title: Text(title),
  );
}
