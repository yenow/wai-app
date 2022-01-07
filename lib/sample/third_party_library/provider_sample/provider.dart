import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value( // Provider로 위젯을 감싸면, 자식 위젯에서 그 값을 사용 가능.
      value: 5, // Provider에서 제공하는 값은 5
      child: MaterialApp(
        home: SimplePage(),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<int>(context); // 가까운 Provider로부터 값을 가져옵니다.

    return Scaffold(
    appBar: AppBar(
    title: Text('Simple app'),
    ),
    body: Center(
    child: Text('${data}'), // 값이 표시됩니다 (여기서는 5)
    ),
    );
  }
}