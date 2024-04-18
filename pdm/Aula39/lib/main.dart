import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic> _addressInfo = {};

  Future<void> _searchCEP(String cep) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.brasilaberto.com/v1/zipcode/$cep'));
      final responseData = json.decode(response.body);
      setState(() {
        _addressInfo = responseData['result'];
      });
    } catch (error) {
      setState(() {
        _addressInfo = {'error': 'CEP não encontrado.'};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Digite o CEP'),
              keyboardType: TextInputType.number,
              maxLength: 8,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _searchCEP(_controller.text);
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            _addressInfo.containsKey('error')
                ? Text(
                    _addressInfo['error'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  )
                : Column(
                    children: [
                      Text(
                        'CEP: ${_addressInfo['zipcode']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Rua: ${_addressInfo['street']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      
                      Text(
                        'Complemento: ${_addressInfo['complement']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Bairro: ${_addressInfo['district']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Cidade: ${_addressInfo['city']} - ${_addressInfo['state']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
