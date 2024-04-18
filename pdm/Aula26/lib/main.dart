import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(title: "Contador de Pessoas", home: Home()));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
   Widget build(BuildContext context) {
    return const MaterialApp(
         title: "Contador de Pessoas",
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas: 0",
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold),
          ),
           ButtonNew3(),     
      Text(
            "Pode Entrar!",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
TextButton(
  onPressed: () {
      // Respond to button press
  },
  child: const Text("TEXT BUTTON"),
)
        ],
      ),
    );
  }
}

class ButtonNew2 extends StatelessWidget {
  const ButtonNew2({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
OutlinedButton(
  onPressed: () {
      // Respond to button press
  },
  child: const Text("OUTLINED BUTTON"),
)
        ],
      ),
    );
  }
}

class ButtonNew3 extends StatelessWidget {
  const ButtonNew3({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
ElevatedButton(
  onPressed: () {
    },
  child: const Text('Elevate Button'),
)
        ],
      ),
    );
  }
}