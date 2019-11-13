import 'package:taiper/src/clayblocks/text.dart';
import 'package:taiper/taiper.dart';

class TaipaBuilder {
  final factories = {
    "text": TextClayblockFactory()
  };

  List<Clayblock> construct(List<ClayblockData> data) =>
    data.map((ClayblockData clayblockData) {
      final typeAndModifier = clayblockData.type.split("/");

      if(factories.keys.contains(typeAndModifier[0])){
        return factories[typeAndModifier[0]].build(clayblockData.value, typeAndModifier[1]);
      } else {
        return null;
      }
    }).where((e) => e != null).toList();
}