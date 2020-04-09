import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import '../../util.dart';
import 'package:taiper/src/clayblocks/image.dart';

void main() {
  testWidgets("Web ImageClayblock", (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final image =  ImageClayblock(type: ImageClayblockType.web, src: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg");

      await pumpWithMaterial(tester, image);

      expect(find.byWidget(image), findsOneWidget);
    });
  });

  testWidgets("Web ImageFactory", (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final image =  ImageClayblockFactory().build("https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg", "web", {});

      await pumpWithMaterial(tester, image);

      expect(find.byWidget(image), findsOneWidget);
    });
  });
}