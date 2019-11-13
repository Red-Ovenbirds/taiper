import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/text.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util.dart';


class TestTitleTextStyle extends StatelessWidget {

  final data;
  var style;

  TestTitleTextStyle({this.data});

  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.title;
    return Text(data, style: style);
  }  
}


class TestBody1TextStyle extends StatelessWidget {

  final data;
  var style;

  TestBody1TextStyle({this.data});

  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.body1;
    return Text(data, style: style);
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
    expect(titleWidget.componentStyle, testWidget.style);
  });

  testWidgets("Test of text of message type", (WidgetTester tester) async {
    final message = "My message";
    final test = "test";

    final bodyWidget = TextClayblock(type: TextClayblockType.body, content: message);
    final testWidget = TestBody1TextStyle(data: test);

    await pumpWithMaterial(
        tester, Column(
          children: <Widget>[
            bodyWidget,
            testWidget
          ],
        ));

    expect(find.text(message), findsOneWidget);
    expect(bodyWidget.componentStyle, testWidget.style);
  });
}
