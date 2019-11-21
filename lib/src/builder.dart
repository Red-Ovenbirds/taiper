import 'package:taiper/src/clayblocks/clayblock.dart';
import 'package:taiper/src/clayblocks/text.dart';
import 'package:taiper/src/clayblocks/image.dart';

class TaipaBuilder {
  final factories = {
    "text": TextClayblockFactory(),
    "image": ImageClayblockFactory(),
  };

  List<Clayblock> construct(List<ClayblockData> data) =>
    data.map((ClayblockData cbData) {
      final type = cbData.type.split("/")[0];
      final modifier = cbData.type.contains("/") ? cbData.type.split("/")[1] : null;

      try {
        return factories[type].build(cbData.value, modifier);
      } on NoSuchMethodError {
        print("TaipaBuilder doesn't knows type $type.");
        return null;
      }
    }).where((e) => e != null).toList();
}