import 'package:taiper/src/clayblocks/text.dart';
import 'package:taiper/taiper.dart';

class TaipaBuilder {
  final factories = {
    "text": TextClayblockFactory()
  };

  List<Clayblock> construct(List<ClayblockData> data) =>
    data.map((ClayblockData cbData) {
      final type = cbData.type.split("/")[0];
      final modifier = cbData.type.contains("/") ? cbData.type.split("/")[0] : null;

      try {
        return factories[type].build(cbData.value, modifier);
      } on NoSuchMethodError {
        print("TaipaBuilder doesn't knows type $type.");
        return null;
      }
    }).where((e) => e != null).toList();
}