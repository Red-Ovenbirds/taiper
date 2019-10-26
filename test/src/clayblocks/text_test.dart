import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taiper/taiper.dart';
import '../../util.dart';


class TestTitleTextStyle extends StatelessWidget {

  final data;
  final styles = [];

  TestTitleTextStyle({this.data});

  Widget build(BuildContext context) {
    styles.add(Theme.of(context).textTheme.title);
    return Text(data, style: styles[0]);
  }  
}


class TestBody1TextStyle extends StatelessWidget {

  final data;
  final styles = [];

  TestBody1TextStyle({this.data});

  Widget build(BuildContext context) {
    styles.add(Theme.of(context).textTheme.body1);
    return Text(data, style: styles[0]);
  }  
}

void main() {
  testWidgets("Test of text of title type", (WidgetTester tester) async {
    final titleString = "My title";
    final testString = "test";

    final titleWidget = TextClayblock(type: TextClayblockType.title, content: titleString);
    final testWidget = TestTitleTextStyle(data: testString);

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Column(
          children: <Widget>[
            titleWidget,
            testWidget
          ],
        ),
      )
    ));

    expect(find.text(titleString), findsOneWidget);
    expect(titleWidget.componentStyle[0], testWidget.styles[0]);
  });

  testWidgets("TextClayblock type body", (WidgetTester tester) async {
    final messenge = "My message";
    final testMessenge = "test";
    
    final bodyWidget = TextClayblock(type: TextClayblockType.body, content: messenge);
    final testWidget = TestBody1TextStyle(data: testMessenge);

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Column(
          children: <Widget>[
            bodyWidget,
            testWidget
          ],
        ),
      ),
    ));

    expect(find.text(messenge), findsOneWidget);
    expect(bodyWidget.componentStyle.first, testWidget.styles.first);
  });

  testWidgets("TextClayblock type ULItem", (WidgetTester tester) async {
    final messenge = "My message";
    final testMessenge = "test";
    final point = "•";

    final ulItemWidget = TextClayblock(content: messenge, type: TextClayblockType.ULItem);
    final testWidget = TestBody1TextStyle(data: testMessenge);

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Column(
          children: <Widget>[
            ulItemWidget,
            testWidget
          ],
        ),
      ),
    ));

    expect(find.text(messenge), findsOneWidget);
    expect(find.text(point), findsOneWidget);
    expect(ulItemWidget.componentStyle.first, testWidget.styles.first);
  });

  testWidgets("Text builder for body", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(message, "text/body"));

    expect(find.text(message), findsOneWidget);
  });

  testWidgets("Text builder for title", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(message, "text/title"));

    expect(find.text(message), findsOneWidget);
  });

  testWidgets("Text builder for ulitem", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(message, "text/ulitem"));

  });

  testWidgets("TextClayblock type body", (WidgetTester tester) async {
    final messenge = "My messenge";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.body, content: messenge));

    expect(find.text(messenge), findsOneWidget);
  });

  testWidgets("TextClayblock type ULItem", (WidgetTester tester) async {
    final messenge = "My messenge";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.ULItem, content: messenge));

    expect(find.text(messenge), findsOneWidget);
  });

  testWidgets("Text builder for body", (WidgetTester tester) async {
    final messenge = "My messenge";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(messenge, "text/body"));

    expect(find.text(messenge), findsOneWidget);
  });

  testWidgets("Text builder for title", (WidgetTester tester) async {
    final messenge = "My messenge";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(messenge, "text/title"));

    expect(find.text(messenge), findsOneWidget);
  });

  testWidgets("Text builder for ulitem", (WidgetTester tester) async {
    final messenge = "My messenge";

    await pumpWithMaterial(tester,
        TextClayblockFactory().build(messenge, "text/ulitem"));

    expect(find.text(messenge), findsOneWidget);
  });

  test("ClayblockData", () {
    final type = "typeee";
    final value = "valueee";

    final cbData = ClayblockData(type: type, value: value);

    expect(cbData.type, type);
    expect(cbData.value, value);
  });

  testWidgets("TaipaBuilder", (WidgetTester tester) async {
    final type1 = "text/body";
    final value1 = "valueee";
    final type2 = "text/title";
    final value2 = "valueeeee";

    final cbDatas = [
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value2),
      ClayblockData(type: type2, value: value2),
    ];

    await pumpWithMaterial(tester, Row(
      children: TaipaBuilder().construct(cbDatas),
    ));

    expect(find.text(value1), findsNWidgets(2));
    expect(find.text(value2), findsNWidgets(2));
  });

  testWidgets("TaiperContainer", (WidgetTester tester) async {
    final type1 = "text/body";
    final value1 = "valueee";
    final type2 = "text/title";
    final value2 = "valueeeee";

    final cbDatas = [
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type2, value: value2),
    ];

    await pumpWithMaterial(tester, TaiperContainer(
      TaipaBuilder().construct(cbDatas),
    ));

    expect(find.text(value1), findsNWidgets(3));
    expect(find.text(value2), findsOneWidget);
  });

  test("ClayblockData", () {
    final type = "typeee";
    final value = "valueee";

    final cbData = ClayblockData(type: type, value: value);

    expect(cbData.type, type);
    expect(cbData.value, value);
  });

  testWidgets("TaipaBuilder", (WidgetTester tester) async {
    final type1 = "text/body";
    final value1 = "valueee";
    final type2 = "dsa/title";
    final value2 = "valueeeee";

    final cbDatas = [
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value2),
      ClayblockData(type: type2, value: value2),
    ];

    await pumpWithMaterial(tester, Row(
      children: TaipaBuilder().construct(cbDatas),
    ));

    expect(find.text(value1), findsNWidgets(2));
    expect(find.text(value2), findsOneWidget);
  });

  testWidgets("TaiperContainer", (WidgetTester tester) async {
    final type1 = "text/body";
    final value1 = "valueee";
    final type2 = "text/title";
    final value2 = "valueeeee";

    final cbDatas = [
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type1, value: value1),
      ClayblockData(type: type2, value: value2),
    ];

    await pumpWithMaterial(tester, TaiperContainer(
      TaipaBuilder().construct(cbDatas),
    ));

    expect(find.text(value1), findsNWidgets(3));
    expect(find.text(value2), findsOneWidget);
  });
}
