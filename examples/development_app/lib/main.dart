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
      value:"Diagnostico:",
      type:"text/title"),
    ClayblockData(
      value:"O diagnóstico é clínico, estabelecido por meio de anamnese detalhada e exame físico.\nSabe-se que a queda na pressão arterial sistólica (PAS) de 20mmHg ou mais pode produzir sintomas de má perfusão cerebral.",
      type:"text/body"),
    ClayblockData(
      value:"Tratamento:",
      type:"text/title"),
    ClayblockData(
      value:"Suspensão de medicamentos hipotensores\nCuidados posturais e relacionados à ingestão alimentar.\nA droga de escolha é a fludrocortisona.",
      type:"text/body"),
    ClayblockData(
      value:"Wanjgarten, M.; Serro-Azul, J.B.; maciel, L.G.; Management of orthostatic and postprandial hypotension. Rev Bras Hipertens vol.14(1): 29-32, 2007",
      type:"text/ref"),
    ClayblockData(
      value:"Gardenghi, G.; Balestra, L.F.;FISIOPATOLOGIA DA HIPOTENSÃO POSTURAL E INTOLERÂNCIA ORTOSTÁTICA.rev pesquisa em fisioterapia. Vol.7 (1), 2017.",
      type:"text/ref" )
  ];
}
