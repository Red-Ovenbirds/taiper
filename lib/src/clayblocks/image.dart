import 'dart:math';
import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/index.dart';
import 'dart:async';
import './clayblock.dart';

class ImageClayblock extends Clayblock {
  final identifier = "image";

  final String src;
  final ImageClayblockType type;

  ImageClayblock({this.src, this.type});

  @override
  Widget build(BuildContext context) {
    return _ImageStateful(type: type, src: src);
  }
}

class _ImageStateful extends StatefulWidget {
  final String src;
  final ImageClayblockType type;

  _ImageStateful({this.type, this.src});

  @override
  State createState() => _ImageStatefulState(type: type, src: src);
}

class _ImageStatefulState extends State<_ImageStateful> {
  Image image;
  final String src;
  final ImageClayblockType type;

  _ImageStatefulState({this.type, this.src});
  
  Future<Size> _calculateImageDimension(Image image) async {
    Completer<Size> completer = Completer();
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
        
    switch(type) {
      case ImageClayblockType.local:
        image = Image.asset(src);
        break;  
      case ImageClayblockType.web:
        image = Image.network(src);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: 
        _calculateImageDimension(image),
      builder:
        (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return TextClayblock(content: "Loading image...");
            case ConnectionState.done:
              Size size = snapshot.data;
              double widthImage = size.width;
              double heightImage = size.height;
              double ratio = heightImage/widthImage;
              double height;


              return LayoutBuilder(
                builder: (context, constraints) {
                  double minConstraints = min(constraints.maxWidth, constraints.maxHeight);
                  double minDevices = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
                  if(minDevices == MediaQuery.of(context).size.height)
                    minDevices *= 0.75;
                  double minDimension = min(minConstraints, minDevices);
                  height = min(minDimension, ratio*minDimension);
                  
                  switch(type) {
                    case ImageClayblockType.local:
                      image = Image.asset(
                        src,
                        height: height,
                        fit: BoxFit.contain,
                      );
                      break;  
                    case ImageClayblockType.web:
                      image = Image.network(
                        src,
                        height: height,
                        fit: BoxFit.contain,
                      );
                  }

                  return image;
                },
            );
          }
          return null;
      },
    );
  }
}

enum ImageClayblockType {local, web}