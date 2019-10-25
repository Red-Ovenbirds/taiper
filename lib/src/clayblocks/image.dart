import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:taiper/src/clayblocks/index.dart';
import './clayblock.dart';
import 'image/local_image.dart';
import 'image/web_image.dart';

class ImageClayblock extends Clayblock {
  final identifier = "image";

  final String src;
  final ImageClayblockType type;

  ImageClayblock({this.src, this.type});

  @override
  Widget build(BuildContext context) {
    switch(type) {
      case ImageClayblockType.local:
        return Container(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroPhotoViewWrapper(
                        imageProvider: AssetImage(src),
                      ),
                    ));
              },
              child: Container(
                child: LocalImage(src),
              ),
            ),
        );
      case ImageClayblockType.web:
        return Container(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroPhotoViewWrapper(
                        imageProvider:  CachedNetworkImageProvider(src),
                      ),
                    ));
              },
              child: Container(
                  child: 
                WebImage(src),
              ),
          ),
        );
    }
  }
}


class HeroPhotoViewWrapper extends StatelessWidget {
  const HeroPhotoViewWrapper(
      {this.imageProvider,
      this.loadingChild,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale});

  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        loadingChild: loadingChild,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: ""),
      ),
    );
  }
}

enum ImageClayblockType { local, web }
