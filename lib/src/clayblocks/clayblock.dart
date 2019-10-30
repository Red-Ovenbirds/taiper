import 'package:flutter/material.dart';
import 'package:taiper/src/styling.dart';

abstract class Clayblock extends StatelessWidget{
   final identifier = "clayblock";
   final style = ClayblockStyle();
}

abstract class ClayblockFactory {
  Clayblock build(String data, String modifier);
}

class ClayblockData {
  String type;
  String value;

  ClayblockData({this.type, this.value});
}
