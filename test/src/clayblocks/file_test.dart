// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taiper/src/clayblocks/file.dart';

import '../../util.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Null value and type', (WidgetTester tester) async {
    final clayblock = FileClayblock(src: null, type: null);
    await pumpWithMaterial(tester, clayblock);
    expect(find.text("Erro ao receber link do arquivo..."), findsOneWidget);
    expect(find.byIcon(Icons.insert_drive_file), findsOneWidget);
  });

  testWidgets('Null value', (WidgetTester tester) async {
    final clayblock = FileClayblock(src: null, type: FileType.link);
    await pumpWithMaterial(tester, clayblock);
    expect(find.text("Erro ao receber link do arquivo..."), findsOneWidget);
  });

  testWidgets('Empty props', (WidgetTester tester) async {
    final clayblock =
        FileClayblock(src: "http://google.com", type: FileType.link, props: {});
    await pumpWithMaterial(tester, clayblock);
    expect(find.text("http://google.com"), findsOneWidget);
    expect(find.byIcon(Icons.link), findsOneWidget);
  });

  testWidgets('Props: label', (WidgetTester tester) async {
    final clayblock = FileClayblock(
        src: "http://google.com",
        type: FileType.link,
        props: {"label": "Test"});
    await pumpWithMaterial(tester, clayblock);
    expect(find.text("Test"), findsOneWidget);
    expect(find.byIcon(Icons.link), findsOneWidget);
  });
}
