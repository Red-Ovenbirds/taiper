import 'package:taiper/src/clayblocks/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taiper/taiper.dart';
import '../../util.dart';

void main() {
  testWidgets("Body", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.body, content: message));

    expect(find.text(message), findsOneWidget);
  });
  testWidgets("Body with builder", (WidgetTester tester) async {
    final message = "My message";
    final clayblock = TextClayblockFactory().build(message, "body", {}) as TextClayblock;
    await pumpWithMaterial(tester,
        clayblock);

    expect(find.text(message), findsOneWidget);
    expect(clayblock.type, TextClayblockType.body);
  });

  testWidgets("Title", (WidgetTester tester) async {
    final message = "My message";
    final clayblock = TextClayblockFactory().build(message, "title", {}) as TextClayblock;
    
    await pumpWithMaterial(
        tester, clayblock);

    expect(find.text(message), findsOneWidget);
    expect(clayblock.type, TextClayblockType.title);
  });
  testWidgets("Title with builder", (WidgetTester tester) async {
    final message = "My message";
    final clayblock = TextClayblockFactory().build(message, "title", {}) as TextClayblock;
    await pumpWithMaterial(tester, clayblock);

    expect(find.text(message), findsOneWidget);
    expect(clayblock.type, TextClayblockType.title);
  });

  testWidgets("ULItem", (WidgetTester tester) async {
    final message = "My message";
    final point = "•";

    final clayblock = TextClayblock(content: message, type: TextClayblockType.ULItem);

    await pumpWithMaterial(tester,
        clayblock);

    expect(find.text(message), findsOneWidget);
    expect(find.text(point), findsOneWidget);
  });
  testWidgets("ULItem with builder", (WidgetTester tester) async {
    final message = "My message";
    final clayblock = TextClayblockFactory().build(message, "ulitem", {}) as TextClayblock;
    await pumpWithMaterial(tester,
        clayblock);
    
    expect(find.text(message), findsOneWidget);
    expect(clayblock.type, TextClayblockType.ULItem);
  });
}
