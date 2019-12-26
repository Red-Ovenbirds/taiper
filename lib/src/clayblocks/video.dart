import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './clayblock.dart';
import 'video/local_web_player.dart';
import 'video/youtube_player.dart';

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
    switch(type) {
      case VideoClayblockType.local:
        return ChewiePlayer(videoPlayerController: VideoPlayerController.asset(src));
      case VideoClayblockType.web:
        return ChewiePlayer(videoPlayerController: VideoPlayerController.network(src));
      case VideoClayblockType.youtube:
        //TODO: implement youtube player
      default:
        return null;
    }
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
