import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class LocalImage extends StatefulWidget {
  final String src;

  LocalImage(this.src);

  @override
  State createState() => LocalImageState(src);
}

class LocalImageState extends State<LocalImage> {
  Image image;
  final String src;

  LocalImageState(this.src);

  Future<Size> _calculateImageDimension() async {
    image = Image.asset(src);
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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _calculateImageDimension(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
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

                return Image.asset(
                  src,
                  height: height,
                  fit: BoxFit.contain,
                );
              },
            );
          default:
            return null;
        }
      },
    );
  }
}
