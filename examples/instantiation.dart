import 'package:flutter/material.dart';
import 'package:taiper/taiper.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.orangeAccent,
      ),
      home: TaiperContainer([
        TextClayblock(content: "test"),
      ]),
    ),
  );
}
