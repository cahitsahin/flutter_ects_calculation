import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nothesaplama/ui/body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber, accentColor: Colors.black87),
      home: MyHomePage(),
    );
  }
}

