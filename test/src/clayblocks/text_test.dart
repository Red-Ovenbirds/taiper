import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taiper/taiper.dart';
import '../../util.dart';

void main() {
  testWidgets("TextClayblock type title", (WidgetTester tester) async {
    final title = "My title";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.title, content: title));

    expect(find.text(title), findsOneWidget);
  });

  testWidgets("TextClayblock type body", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.body, content: message));

    expect(find.text(message), findsOneWidget);
  });

  testWidgets("TextClayblock type ULItem", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.ULItem, content: message));

    expect(find.text(message), findsOneWidget);
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

    expect(find.text(message), findsOneWidget);
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
