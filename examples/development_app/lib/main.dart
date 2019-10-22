import 'package:flutter/material.dart';
import 'package:taiper/taiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taiper Example"),
      ),
      body: Center(
        child: TaiperContainer([
          TextClayblock(
            type: TextClayblockType.title,
            content: "Hello World. The first title.",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "Example of text in body.",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "A new example of text in body. More, more, more, more, more, more, more, more, more, more, more, more, more and more words to fill some lines",
          ),
          TextClayblock(
            type: TextClayblockType.ref,
            content: "Lagrèze W 1 , diem R . [New aspects in the therapy of multiple sclerosis and optic neuritis]. Ophthalmologe. 2014 Aug;111(8):709-14. doi: 10.1007/s00347-013-2987-7.",
          ),
          TextClayblock(
            type: TextClayblockType.title,
            content: "The second title",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "A third text of body type. It's ok?",
          ),
        ]),
      ),
    );
  }
}
