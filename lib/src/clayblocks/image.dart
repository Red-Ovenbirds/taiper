import 'dart:math';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
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
        return LocalImage(src);
      case ImageClayblockType.web:
        return WebImage(src);
    }
  }
}

enum ImageClayblockType { local, web }
