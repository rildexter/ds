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
  int people = 0; // Variável para armazenar o número de pessoas
  String infoText = "Pode Entrar!"; // Texto de informação

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contador de Pessoas",
          style: TextStyle(
            fontSize: 30.0, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito
            color: Colors.blue, // Cor do texto
            fontStyle: FontStyle.italic, // Itálico
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/restaurant.jpg"), // Imagem de fundo
            fit: BoxFit.cover, // Cobrir todo o espaço disponível
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $people', // Exibe o número atual de pessoas
              style: const TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            ButtonNew(
              onPressedAdd: () { // Função para incrementar o número de pessoas
                setState(() {
                  people++; // Incrementa o número de pessoas
                });
              },
              onPressedSubtract: () { // Função para decrementar o número de pessoas
                setState(() {
                  people--; // Decrementa o número de pessoas
                });
              },
            ),
            // Mudança de cores para o texto
            Text(
              infoText, // Exibe o texto de informação
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
  final VoidCallback? onPressedAdd; // Função chamada ao pressionar o botão de adição
  final VoidCallback? onPressedSubtract; // Função chamada ao pressionar o botão de subtração

  const ButtonNew({this.onPressedAdd, this.onPressedSubtract, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton( // Botão de adição
              onPressed: onPressedAdd, // Chama a função onPressedAdd ao ser pressionado
              child: const Text('+1', style: TextStyle(fontSize: 40.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton( // Botão de subtração
              onPressed: onPressedSubtract, // Chama a função onPressedSubtract ao ser pressionado
              child: const Text('-1', style: TextStyle(fontSize: 40.0)),
            ),
          ),
        ],
      ),
    );
  }
}
