import 'package:flutter/material.dart';
import 'package:taiper/src/widgets/video/chewie_player.dart';
import './clayblock.dart';

class VideoClayblock extends Clayblock {
  final identifier = "video";

  final VideoClayblockType type;
  final String src;

  VideoClayblock({
    @required this.src,
    this.type = VideoClayblockType.web,
  });
  
  @override
  Widget build(BuildContext context) {
    return ChewiePlayer(src: src, type: type);
  }

}

class VideoClayblockFactory extends ClayblockFactory {

  final typesDict = {
    "local": VideoClayblockType.local,
    "web": VideoClayblockType.web
  };

  Clayblock build(String data, String type, Map<String, dynamic> props) =>
    VideoClayblock(type: typesDict[type], src: data);
} 

enum VideoClayblockType {
  local, web
}
