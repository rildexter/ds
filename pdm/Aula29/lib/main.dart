import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int people = 0;
  String infoText = "Pode Entrar!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Pessoas",
     //adicionando estilo a appbar   
          style: TextStyle(
            fontSize: 30.0, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito
            color: Colors.black, // Cor do texto
            fontStyle: FontStyle.italic, // Itálico
          )),
      ),
      //adicionamos aqui a imagem para o background
      //crie a pasta images e adicione a imagem 
      //coloque o caminho no arquivo pubspec.yaml
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/restaurant.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $people',
              style: const TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,fontSize: 30.0),
            ),
            const ButtonNew(),
            //mudança de cores para o texto
            Text(
              infoText,
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonNew extends StatelessWidget {
  const ButtonNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Adicionando função
                debugPrint("Teste +1");
              },
              child: const Text('+1', style: TextStyle(fontSize: 40.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Teste -1");
              },
              child: const Text('-1', style: TextStyle(fontSize: 40.0)),
            ),
          ),
        ],
      ),
    );
  }
}
