import 'package:flutter/material.dart';
import 'package:taiper/taiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Teste"),
        ),
        body: Center(
          child: TaiperContainer([
            TextClayblock(type: TextType.title, content: "Olar"),
            TextClayblock(
                type: TextType.body,
                content:
                    "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd"),
            TextClayblock(
                type: TextType.body,
                content:
                    "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd"),
            TextClayblock(type: TextType.title, content: "Olar"),
            TextClayblock(
                type: TextType.body,
                content:
                    "Oi som teste askdnajks dkjna sdkjnasd kjansd aksjdna dskjansdjknaskjdna sdkansd aksjdna sdkjansdjknasd asdkjnasd"),
          ]),
        ));
  }
}
