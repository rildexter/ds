//Passo 1: Definição da Estrutura Básica
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Calculadora IMC",
    home: IMCCalculator(),
  ));
}

//Passo 2: Criação da Classe IMCCalculator
class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  IMCCalculatorState createState() => IMCCalculatorState();
}

//Passo 3: Criação da Classe IMCCalculatorState:
class IMCCalculatorState extends State<IMCCalculator> {
  late TextEditingController heightController;
  late TextEditingController weightController;
  double imc = 0.0;
  String result = '';

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}


//Passo 5: Implementação do Método de Cálculo do IMC:
 
// Passo 6: Implementação da Função de Interpretação do IMC
 
//Passo 4: Construção da Interface do Usuário:
@override
Widget build(BuildContext context){
  return Scaffold(
appBar: AppBar(
  title: const Text("Calculadora de IMC"),
),
body: SingleChildScrollView(
  child: Container(
    margin: const EdgeInsets.all(20.0),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller:heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Altura (m)'
          ),
        ),
        const SizedBox(height: 16.0,),
                
                TextField(
          controller:weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Peso (kg)',
          ),
        ),
        const SizedBox(height: 16.0,),
      ],),
  ),
  ,),

  )
}