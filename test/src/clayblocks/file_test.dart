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

  testWidgets('Valid src', (WidgetTester tester) async {
    final clayblock =
        FileClayblock(src: "https://www.google.com", type: FileType.image);
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: Material(child: clayblock),
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byIcon(Icons.image), findsOneWidget);

    await tester.tap(find.byIcon(Icons.image));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //Not conclusive. Could mean AlertDialog is shown or intent being shown.
    verify(mockObserver.didPush(any, any)).called(equals(1));

    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('Invalid src', (WidgetTester tester) async {
    final clayblock = FileClayblock(src: "jknkjn", type: FileType.video);
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: Material(child: clayblock),
        navigatorObservers: [mockObserver],
      ),
    );
    expect(find.byIcon(Icons.image), findsOneWidget);

    await tester.tap(find.byIcon(Icons.movie));
    await tester.pumpAndSettle(Duration(seconds: 2));

    verify(mockObserver.didPush(any, any)).called(equals(1));
    await tester.pumpAndSettle(Duration(seconds: 2));

    //Not conclusive. Can't find AlertDialog.
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
