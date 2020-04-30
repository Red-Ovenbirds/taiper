import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/index.dart';

class TaiperContainer extends StatelessWidget {
  final List<Clayblock> clayblocks;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  TaiperContainer(this.clayblocks,
      {this.padding = const EdgeInsets.all(8),
      this.shrinkWrap = false,
      this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemCount: clayblocks.length,
      itemBuilder: (context, index) {
        var clayblock = clayblocks[index];
        return Padding(padding: clayblock.style.padding, child: clayblock);
      },
    );
  }
}
