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
          TaipaBuilder().construct(exampleData)
        )
      )
    );

  final exampleData = [
    ClayblockData(
      value: "Definição:",
      type:"text/title"),
    ClayblockData(
      value: "A hipotensão ortostática ocorre com a mudança de posição, particularmente pela manhã ou após refeições copiosas, exercício físico e banho quente, situações que levam a uma redistribuição desfavorável do volume sangüíneo.",
      type: "text/body"),
    ClayblockData(
      value: "Sinais e sintomas:",
      type:"text/title"),
    ClayblockData(
      value: "Tontura\nSíncope\nQuedas\nDistúrbios visuais\nDéficits neurológicos focais\nCervicalgia com irradiação para os ombros\nclaudicação intermitente\nangina de peito\nIAM",
      type:"text/body"),
    ClayblockData(
      value:"xdgcfhgvjbknjlmnjkhvgycftdxcfvghjbhknlknjkhvgcftxdcfygvbhjnljbhvgycftfgyihkjj hcfyftgyhiuonjlkbhjgvhcfvhojghcfxghgvjhkjlkvjgcfhgjvhbkjvcbRow (mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [ SizedBox( width: Theme.of(context).textTheme.body1.fontSize, child: Text(, textAlign: TextAlign.center) ), Expanded( child: Text(content) ), ] )gjhklbcvgjhkugvjgvhkvgjhkvjhkivnjhkuvgjhkuvgjhkuvjhkuvgvjhkugvgchjuogjvchvjuhigjvchjuihgvjiuhgvjhuigvjjhuhgvju",
      type:"text/ref" )
  ];
}
