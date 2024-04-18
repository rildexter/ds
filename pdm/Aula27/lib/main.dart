import 'package:flutter/material.dart';

void main() {
  debugProfileBuildsEnabled = true;
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
  //aqui e o local para as variaveis
  int people = 0;
  String infoText = "Pode Entrar!";
  @override
  Widget build(BuildContext context) {
    //ackground branco está sendo definido implicitamente pela cor de fundo padrão do Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Pessoas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pessoas: $people',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const ButtonNew(),
          Text(
            infoText,
            style: const TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
class ButtonNew extends StatelessWidget {
const ButtonNew({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //por enquanto não temos ação

          ElevatedButton(
            onPressed: () {
              // Adicionando função
              debugPrint("Teste +1");
            },
            child: const Text('+1',
                style: TextStyle(fontSize: 40.0, color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Teste -1");
            },
            child: const Text('-1',
                style: TextStyle(fontSize: 40.0, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
