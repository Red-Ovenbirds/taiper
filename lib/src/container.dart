import 'package:flutter/material.dart';
import 'package:taiper/src/clayblocks/index.dart';

class TaiperContainer extends StatelessWidget {
  TaiperContainer(this.clayblocks);
  final List<Clayblock> clayblocks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clayblocks.length,

      itemBuilder: (context, index){
      //TODO: change padding according to style
      return Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), child: clayblocks[index]);
    });
  }
}
