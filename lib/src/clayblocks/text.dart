import 'package:flutter/material.dart';
import './clayblock.dart';

class TextClayblock extends Clayblock {
  final identifier = "text";
  
  final TextClayblockType type;
  final String content;
  
  TextClayblock({this.type = TextClayblockType.body, this.content});

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    
    switch (type) {
      case TextClayblockType.body:
        style = Theme.of(context).textTheme.body1;
        break;
      case TextClayblockType.title:
        style = Theme.of(context).textTheme.title;
    }

    return Text(content, style: style);
  }

}

enum TextClayblockType {
  body, title
}
