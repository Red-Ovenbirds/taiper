import 'dart:math';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WebImage extends StatefulWidget {
  final String url;
  final String textRefresh;

  WebImage(this.url, {this.textRefresh = "Tap to refresh!"});

  @override
  State createState() => WebImageState(url);
}

class WebImageState extends State<WebImage> {
  Image image;
  final String url;
  final String textRefresh;

  WebImageState(this.url, {this.textRefresh = "Tap to refresh image!"});

  refreshButton() => GestureDetector(
          child: Stack(
        children: <Widget>[
          Center(
            child: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {});
                }),
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 46),
            child: Text(textRefresh),
          )),
        ],
      ),
      onTap: () => null,);

  showImage(Size size, ImageProvider imageProvider) {
    double widthImage = size.width;
    double heightImage = size.height;
    double ratio = heightImage / widthImage;
    double height;

    return LayoutBuilder(
      builder: (context, constraints) {
        double parentMinHeight =
            min(constraints.maxWidth, constraints.maxHeight);
        double deviceMinHeight = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height);
        if (deviceMinHeight == MediaQuery.of(context).size.height)
          deviceMinHeight *= 0.75;
        double maxHeightAvaliable = min(parentMinHeight, deviceMinHeight);
        height = min(min(0.75 * maxHeightAvaliable, ratio * maxHeightAvaliable),
            heightImage);

        image = Image(
          image: imageProvider,
          height: height,
          fit: BoxFit.contain,
        );
        return image;
      },
    );
  }

  Future<Size> _calculateImageDimension(ImageProvider image) async {
    Completer<Size> completer = Completer();
    image.resolve(ImageConfiguration()).addListener(
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
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => refreshButton(),
      imageBuilder: (context, imageProvider) => FutureBuilder(
        future: _calculateImageDimension(imageProvider),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) return refreshButton();
              return showImage(snapshot.data, imageProvider);
            default:
              return null;
          }
        },
      ),
    );
  }
}
