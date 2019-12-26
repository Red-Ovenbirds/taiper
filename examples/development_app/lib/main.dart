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
        child: TaiperContainer(
          TaipaBuilder().construct(exampleData),
        ),
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
      type:"text/ulitem",
    ),
    ClayblockData(
      value:"Unordered list item that has a veeeeeeery long string to show how it does not overflow",
      type:"text/ulitem",
    ),
    ClayblockData(
      type: "file/image",
      value: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
    ),
    ClayblockData(
      type: "file/link",
      value: "https://www.google.com",
    ),
    ClayblockData(
      type: "file/sklndkjnf",
      value: "ksjdnf",
    ),
    ClayblockData(
      type: "video/web",
      value: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
    ),
    ClayblockData(
      type: "video/web",
      value: "https://www.sample-videos.com/video123/flv/240/big_buck_bunny_240p_30mb.flv",
    ),
    ClayblockData(
      type: "video/web",
      value: "https://www.sample-videos.com/video123/mkv/720/big_buck_bunny_720p_30mb.mkv",
    ),
    ClayblockData(
      type: "video/web",
      value: "https://www.sample-videos.com/video123/3gp/144/big_buck_bunny_144p_2mb.3gp",
    ),
    ClayblockData(
      type: "video/local",
      value: "assets/SampleVideo_1280x720_10mb.mkv",
    ),
  ];
}
