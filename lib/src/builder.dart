import 'package:taiper/src/clayblocks/clayblock.dart';
import 'package:taiper/src/clayblocks/text.dart';
import 'package:taiper/src/clayblocks/image.dart';

class TaipaBuilder {
  final factories = {
    "text": TextClayblockFactory(),
    "image": ImageClayblockFactory(),
  };

  List<Clayblock> construct(List<ClayblockData> data) =>
    data.map((ClayblockData clayblockData) {
      final typeAndModifier = clayblockData.type.split("/");
      return factories[typeAndModifier[0]].build(clayblockData.value, typeAndModifier[1]);
    }).toList();
}