import 'dart:math';
import 'dart:io';
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
  bool _reloadIcon = false;
  Image image;
  final String src;
  final ImageClayblockType type;

  _ImageStatefulState({this.type, this.src});

  myreload() => Center(
        child: IconButton(
            icon: Icon(Icons.replay),
            onPressed: () {
              setState( () {_reloadIcon = false;} );
            }),
      );

  Future<Size> _calculateImageDimension() async {
    switch (type) {
      case ImageClayblockType.local:
        image = Image.asset(src);
        break;
      case ImageClayblockType.web:
        await InternetAddress.lookup('google.com');
        image = Image.network(src);
    }

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

  myfuture() => FutureBuilder(
        future: _calculateImageDimension(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return myreload();
              } else {
                Size size = snapshot.data;
                double widthImage = size.width;
                double heightImage = size.height;
                double ratio = heightImage / widthImage;
                double height;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    double minConstraints =
                        min(constraints.maxWidth, constraints.maxHeight);
                    double minDevices = min(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height);
                    if (minDevices == MediaQuery.of(context).size.height)
                      minDevices *= 0.75;
                    double minDimension = min(minConstraints, minDevices);
                    height = min(min(0.75 * minDimension, ratio * minDimension),
                        heightImage);

                    switch (type) {
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
          }
          return null;
        },
      );

  @override
  Widget build(BuildContext context) {
    return _reloadIcon ? myreload() : myfuture();
  }
}

enum ImageClayblockType { local, web }
