import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Número total de abas
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Navegação com Tabs'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Conteúdo da primeira aba
              Center(child: Text('Conteúdo da Tab 1')),
              // Conteúdo da segunda aba
              Center(child: Text('Conteúdo da Tab 2')),
              // Conteúdo da terceira aba
              Center(child: Text('Conteúdo da Tab 3')),
            ],
          ),
        ),
      ),
    );
  }
}
