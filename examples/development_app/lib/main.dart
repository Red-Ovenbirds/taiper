import 'dart:collection';

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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<ClayblockData> exampleData;

  @override
  void initState() {
    _makeExampleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taiper Example"),
      ),
      body: Center(
        child: TaiperContainer(
          TaipaBuilder().construct(exampleData),
        ),
      ),
    );
  }

  void _makeExampleData() {
    LinkedHashMap<String, dynamic> fileImageProps = LinkedHashMap<String, dynamic>();
    LinkedHashMap<String, dynamic> textProps = LinkedHashMap<String, dynamic>();
    fileImageProps["label"] = "Imagem do Jõao de Barro";
    textProps["color"] = "0xFFFF0000";
    textProps["fontSize"] = 30.0;

    exampleData = [
      ClayblockData(
        type:"text/title",
        value: "Definição:",
        props: textProps,
      ),
      ClayblockData(
        type: "text/body",
        value: "A hipotensão ortostática ocorre com a mudança de posição, particularmente pela manhã ou após refeições copiosas, exercício físico e banho quente, situações que levam a uma redistribuição desfavorável do volume sangüíneo.",
      ),
      ClayblockData(
        type:"text/title",
        value: "Sinais e sintomas:",
      ),
      ClayblockData(
        type:"text/body",
        value: "Tontura\nSíncope\nQuedas\nDistúrbios visuais\nDéficits neurológicos focais\nCervicalgia com irradiação para os ombros\nclaudicação intermitente\nangina de peito\nIAM",
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
        type:"text/ulitem",
        value:"Unordered list example item",
      ),
      ClayblockData(
        type:"text/ulitem",
        value:"Unordered list item that has a veeeeeeery long string to show how it does not overflow",
      ),
      ClayblockData(
        type: "file/image",
        value: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg/250px-Flickr_-_Dario_Sanches_-_JO%C3%83O-DE-BARRO_%28Furnarius_rufus%29_%285%29.jpg",
        props: fileImageProps,
      ),
      ClayblockData(
        type: "file/link",
        value: "https://www.google.com",
      ),
      ClayblockData(
        type: "file/sklndkjnf",
        value: "ksjdnf",
      ),
    ];
  }

}
