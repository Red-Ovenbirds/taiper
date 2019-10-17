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
        title: Text("Teste"),
      ),
      body: Center(
        child: TaiperContainer([
          TextClayblock(
            type: TextClayblockType.title,
            content: "Olar",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd",
          ),
          TextClayblock(
            type: TextClayblockType.title,
            content: "Olar",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd",
          ),
        ]),
      ),
    );
  }
}
