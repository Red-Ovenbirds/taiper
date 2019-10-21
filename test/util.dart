import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<Null> pumpWithMaterial(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(new MaterialApp(home: new Material(child: widget)));
}