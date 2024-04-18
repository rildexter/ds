// Configuração Inicial e Requisição HTTP
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//vejam no pubspec.yaml as dependencias 
// cupertino_icons: ^1.0.6  e http: ^1.2.0
const request = "https://api.hgbrasil.com/finance?format=json-cors&key=f4c0c86e";

void main() async {
  runApp(
    MaterialApp(
      home: const Home(),
      theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
    ),
  );
}
//gerando o controle de estado da tela
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}
//sta função getData() é responsável por fazer a requisição HTTP à API 
//e retornar os dados como um mapa de tipo Map<String, dynamic>.
Future<Map<String, dynamic>> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

//Estado da Tela e Lógica de Conversão
class HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  void _realChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  late double dolar = 0;
  late double euro = 0;


//Construção da Interface do Usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('\$ Conversor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  'Carregando Dados...',
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
            //Construção do Corpo da Tela
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erro ao carregar',
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data?["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
                      buildTextField("Reais", "R\$", realController, _realChange),
                      const Divider(),
                      buildTextField("Dólares", "US\$", dolarController, _dolarChange),
                      const Divider(),
                      buildTextField("Euros", "€", euroController, _euroChange),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
//Construção dos Campos de Entrada
Widget buildTextField(
    String label, String prefix, TextEditingController controller, Function(String) onChanged) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.amber),
      border: const OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: const TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: onChanged,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
