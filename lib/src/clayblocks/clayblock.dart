import 'package:flutter/material.dart';
import 'package:taiper/src/styling.dart';

abstract class Clayblock extends StatelessWidget{
   final identifier = "clayblock";
   final style = ClayblockStyle();
}

abstract class ClayblockFactory {
  Clayblock build(String data, String modifier, Map<String, dynamic> props);
}

class ClayblockData {
  String type;
  String value;
  Map<String, dynamic> props;

  ClayblockData({@required this.type, this.value, this.props});
}
