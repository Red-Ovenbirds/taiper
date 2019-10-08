import 'package:flutter/material.dart';
import './clayblock.dart';

class TextClayblock extends Clayblock {
  final identifier = "text";
  final TextType type;
  
  TextClayblock({this.type = TextType.body, this.content});

  final String content;
  @override
  Widget build(BuildContext context) {
    TextStyle style;
    
    switch (type) {
      case TextType.body:
        style = Theme.of(context).textTheme.body1;
        break;
      case TextType.title:
        style = Theme.of(context).textTheme.title;
    }

    return Text(content, style: style);
  }

}

enum TextType {
  body, title
}

