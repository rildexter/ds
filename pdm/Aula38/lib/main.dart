import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiExample extends StatefulWidget {
  const ApiExample({super.key});
  @override
  _ApiExampleState createState() => _ApiExampleState();
}
class _ApiExampleState extends State<ApiExample> {
  String _responseData = '';

  // Função assíncrona para fazer a chamada da API
  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);

    // Atualiza o estado com os dados recebidos da API
    setState(() {
      _responseData = response.body;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data from API'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Response from API:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            Expanded(
              child: SingleChildScrollView(
                child: Text(_responseData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ApiExample(),
  ));
}


