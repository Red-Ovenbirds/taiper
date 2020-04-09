import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../clayblocks/video.dart';

class ChewiePlayer extends StatefulWidget {
  final String src;
  final VideoClayblockType type;

  ChewiePlayer({
    Key key,
    this.src,
    this.type,
  }) : super(key: key);

  @override
  State createState() => ChewiePlayerState();
}

class ChewiePlayerState extends State<ChewiePlayer> {
  ChewieController _chewieController;
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    
    if (widget.type == VideoClayblockType.web) {
      _videoController = VideoPlayerController.network(
        widget.src,
      );
    } else {
      _videoController = VideoPlayerController.asset(
        widget.src,
      );
    }

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            "Não foi possível reproduzir este vídeo.",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0), child: Chewie(
            controller: _chewieController,
          ));
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoController.dispose();
  }
}
