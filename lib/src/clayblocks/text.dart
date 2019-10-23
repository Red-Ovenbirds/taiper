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

  Widget buildBodyText(BuildContext context) {
    componentStyle.add(Theme.of(context).textTheme.body1);
    return Text(content, style: componentStyle.first);
  }
    

  Widget buildTitleText(BuildContext context) {
    componentStyle.add(Theme.of(context).textTheme.title);
    return Text(content, style: componentStyle.first); 
  }

  Widget buildULItem(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Container(
            child: Text("•", textAlign: TextAlign.center),
            width: Theme.of(context).textTheme.body1.fontSize,
          ),
          Expanded(
            child: Text(content)
          ),
        ]
      );
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
      case TextClayblockType.ref:
        w = buildULItem(context);
        break;
      default: {
        w = buildBodyText(context);
      }
    }
    return w;
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
