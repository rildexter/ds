import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Navegação com Drawer'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),

                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Página Inicial'),
                onTap: () {
                  // Implemente a navegação para a página inicial
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Configurações'),
                onTap: () {
                  // Implemente a navegação para as configurações
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        
        body: const Center(
          child: Text('Conteúdo Principal'),
        ),
      ),
    );
  }
}
