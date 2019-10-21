import 'package:taiper/src/clayblocks/text.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util.dart';

void main() {
  testWidgets("Test of text of title type", (WidgetTester tester) async {
    final title = "My title";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.title, content: title));

    expect(find.text(title), findsOneWidget);
  });

  testWidgets("Test of text of message type", (WidgetTester tester) async {
    final message = "My message";

    await pumpWithMaterial(
        tester, TextClayblock(type: TextClayblockType.body, content: message));

    expect(find.text(message), findsOneWidget);
  });
}
