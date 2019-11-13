import 'package:flutter/material.dart';
import './clayblock.dart';

class TextClayblock extends Clayblock {
  final identifier = "text";
  
  final TextClayblockType type;
  final String content;
  final List<TextStyle> componentStyle = [];
  
  TextClayblock({this.type = TextClayblockType.body, this.content}) {
    switch (type) {
      case TextClayblockType.body:
        this.style.padding = EdgeInsets.symmetric(vertical: 4, horizontal: 16);
        break;
      case TextClayblockType.title:
        this.style.padding = EdgeInsets.only(top: 16, bottom: 4, right: 16, left: 16);
        break;
      case TextClayblockType.ref:
        this.style.padding = EdgeInsets.symmetric(vertical: 16, horizontal: 16);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextClayblockType.body:
        componentStyle.add(Theme.of(context).textTheme.body1);
        break;
      case TextClayblockType.title:
        componentStyle.add(Theme.of(context).textTheme.title);
        break;
      case TextClayblockType.ref:
        componentStyle.add(Theme.of(context).textTheme.body2);
    }

    final displayText = type != TextClayblockType.ref ? content : '\u2022 ' + content;

    return Text(displayText, style: componentStyle[0]);
  }
}

class TextClayblockFactory extends ClayblockFactory {

  final typesDict = {
    "body": TextClayblockType.body,
    "title": TextClayblockType.title,
    "ref": TextClayblockType.ref
  };

  Clayblock build(String data, String type) =>
    TextClayblock(type: typesDict[type], content: data);
} 

enum TextClayblockType {
  body, title, ref
}
