import 'package:flutter_test/flutter_test.dart';
import 'package:taiper/taiper.dart';


void main() {
  test("ClayblockData", () {
    final type = "typeee";
    final value = "valueee";

    final cbData = ClayblockData(type: type, value: value);

    expect(cbData.type, type);
    expect(cbData.value, value);
  });
}