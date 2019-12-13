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
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Text("Taiper Example"),
      ),
      body: Center(
<<<<<<< HEAD
        child: TaiperContainer(
          TaipaBuilder().construct(exampleData),
        ),
=======
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
            type: TextClayblockType.title,
            content: "The second title",
          ),
          TextClayblock(
            type: TextClayblockType.body,
            content:
              "A third text of body type. It's ok?",
          ),
          ImageClayblock(
            type: ImageClayblockType.local,
            src: "assets/Red-Ovenbird.jpg",
          ),
          ImageClayblock(
            type: ImageClayblockType.web,
            src: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
          ),
          VideoClayblock(
            src: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
            type: VideoClayblockType.web,
          )
        ]),
>>>>>>> Video example and usage of new cached_image pub
      ),
    );

  final exampleData = [
    ClayblockData(
      value: "Definição:",
      type:"text/title",
    ),
    ClayblockData(
      value: "A hipotensão ortostática ocorre com a mudança de posição, particularmente pela manhã ou após refeições copiosas, exercício físico e banho quente, situações que levam a uma redistribuição desfavorável do volume sangüíneo.",
      type: "text/body",
    ),
    ClayblockData(
      value: "Sinais e sintomas:",
      type:"text/title",
    ),
    ClayblockData(
      value: "Tontura\nSíncope\nQuedas\nDistúrbios visuais\nDéficits neurológicos focais\nCervicalgia com irradiação para os ombros\nclaudicação intermitente\nangina de peito\nIAM",
      type:"text/body",
    ),
    ClayblockData(
      type: "image/local",
      value: "assets/Red-Ovenbird.jpg",
    ),
    ClayblockData(
      type: "image/web",
      value: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
    ),
    ClayblockData(
      value:"Unordered list example item",
      type:"text/ulitem" ),
    
    ClayblockData(
      value:"Unordered list item that has a veeeeeeery long string to show how it does not overflow",
      type:"text/ulitem" ),
    
    ClayblockData(
      type: "file/image",
      value: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg"
    ),

    ClayblockData(
      type: "file/link",
      value: "https://www.google.com"
    ),

    ClayblockData(
      type: "file/sklndkjnf",
      value: "ksjdnf"
    )

  ];
}
