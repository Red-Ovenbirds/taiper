import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/index.dart';

class TaiperContainer extends StatelessWidget {
  TaiperContainer(this.clayblocks);
  final List<Clayblock> clayblocks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clayblocks.length,
      itemBuilder: (context, index) {
        var clayblock = clayblocks[index];
        return Padding(padding: clayblock.style.padding, child: clayblock);
      },
    );
  }
}
