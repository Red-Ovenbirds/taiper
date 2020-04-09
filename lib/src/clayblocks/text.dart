import 'package:flutter/material.dart';
import './clayblock.dart';

class TextClayblock extends Clayblock {
  final identifier = "text";
  
  final TextClayblockType type;
  final String content;
  TextStyle get styleProps {
    return TextStyle(
      color: this.color,
      fontSize: this.fontSize,
    );
  }
  double get fontSize {
    if(props != null)
      return props["fontSize"];
    return null;
  }
  Color get color {
    if(props != null)
      return Color(_hexaToInt(props["color"]));
    return null;
  }

  int _hexaToInt(String numberHexa) {
    int number;
    if(numberHexa.length >= 2 && numberHexa.substring(0, 2) == "0x")
      numberHexa = numberHexa.substring(2, numberHexa.length).toLowerCase();
    number = int.parse(numberHexa, radix:16);
    return number;
  }
  
  TextClayblock({this.type = TextClayblockType.body, this.content, Map<String, dynamic> props}) : super(props: props) {
    switch (type) {
      case TextClayblockType.body:
        this.style.padding = EdgeInsets.symmetric(vertical: 4, horizontal: 16);
        break;
      case TextClayblockType.title:
        this.style.padding = EdgeInsets.only(top: 16, bottom: 4, right: 16, left: 16);
        break;
      case TextClayblockType.ULItem:
        this.style.padding = EdgeInsets.symmetric(vertical: 16, horizontal: 16);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    switch (type) {
      case TextClayblockType.body:
        w = buildBodyText(context);
        break;
      case TextClayblockType.title:
        w = buildTitleText(context);
        break;
      case TextClayblockType.ULItem:
        w = buildULItem(context);
        break;
      default:
        w = buildBodyText(context);
    }
    return w;
  }

  TextStyle componentStyle(BuildContext context) {
    TextStyle textStyle;

    switch (type) {
      case TextClayblockType.body:
        textStyle = Theme.of(context).textTheme.body1;
        break;
      case TextClayblockType.title:
        textStyle = Theme.of(context).textTheme.title;
        break;
      case TextClayblockType.ULItem:
        textStyle = Theme.of(context).textTheme.body1;
        break;
    }

    return textStyle.merge(styleProps);
  }

  Widget buildBodyText(BuildContext context) {
    return Text(content, style: componentStyle(context));
  }

  Widget buildTitleText(BuildContext context) {
    return Text(content, style: componentStyle(context));
  }

  Widget buildULItem(BuildContext context) { 
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Container(
            child: Text("•", textAlign: TextAlign.center),
            width: componentStyle(context).fontSize,
          ),
          Expanded(
            child: Text(content, style: componentStyle(context))
          ),
        ]
      );
  }
}

class TextClayblockFactory extends ClayblockFactory {
  final typesDict = {
    "body": TextClayblockType.body,
    "title": TextClayblockType.title,
    "ulitem": TextClayblockType.ULItem
  };

  Clayblock build(String data, String type, Map<String, dynamic> props) =>
    TextClayblock(type: typesDict[type], content: data, props: props);
} 

enum TextClayblockType {
  body, title, ULItem
}
