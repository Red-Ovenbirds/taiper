import 'package:flutter/material.dart';
import 'package:taiper/src/widgets/video/chewie_player.dart';
import './clayblock.dart';

class VideoClayblock extends Clayblock {
  final identifier = "video";

  final VideoClayblockType type;
  final String src;

  VideoClayblock({
    @required this.src,
    this.type = VideoClayblockType.youtube,
  });
  
  @override
  Widget build(BuildContext context) {
    if (type == VideoClayblockType.local || type == VideoClayblockType.web) {
      return ChewiePlayer(src: src, type: type);
    }
    return null;
  }

}

class VideoClayblockFactory extends ClayblockFactory {

  final typesDict = {
    "local": VideoClayblockType.local,
    "web": VideoClayblockType.web,
    "youtube": VideoClayblockType.youtube
  };

  Clayblock build(String data, String type) =>
    VideoClayblock(type: typesDict[type], src: data);
} 

enum VideoClayblockType {
  local, web, youtube
}
