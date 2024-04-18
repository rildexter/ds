import 'package:flutter/material.dart';

//separando o programa em partes / modulos
void main() {
  runApp(const MeuAplicativo());
}

//classe sendo chamada
class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
         title: "Contador",
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Test1(),    
          Test2(),     
    

        ],
      ),
    );
  }
}


class Test1 extends StatelessWidget {
  const Test1({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
                    Text(
            "Exemplo 1",
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
  Text(
            "Exemplo 2",
            style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      ),
    );
  }
}

