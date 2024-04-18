import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora de IMC",
    home: IMCCalculator(),
  ));
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
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

  // Função para calcular o IMC
  void calculateIMC() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    if (height > 0 && weight > 0) {
      double calculatedIMC = weight / (height * height);
      setState(() {
        imc = calculatedIMC;
        result = interpretIMC(calculatedIMC);
      });
    } else {
      setState(() {
        imc = 0.0;
        result = 'Altura e peso devem ser maiores que zero.';
      });
    }
  }

  // Função para interpretar o IMC e retornar a classificação correspondente
  String interpretIMC(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 34.9) {
      return 'Obesidade grau I';
    } else if (imc >= 35 && imc < 39.9) {
      return 'Obesidade grau II';
    } else {
      return 'Obesidade grau III';
    }
  }

  // Função para limpar os campos e redefinir o IMC e a classificação
  void resetFields() {
    setState(() {
      heightController.text = '';
      weightController.text = '';
      imc = 0.0;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
      ),
      body: SingleChildScrollView( 
        // Adicionando SingleChildScrollView para evitar overflow
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Entrada de altura
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (m)',
                ),
              ),
              const SizedBox(height: 16.0),
              // Entrada de peso
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                ),
              ),
              const SizedBox(height: 16.0),
              // Botão para calcular o IMC
              ElevatedButton(
                onPressed: calculateIMC,
                child: const Text('Calcular IMC'),
              ),
              const SizedBox(height: 16.0),
              
              // Botão para resetar os campos
              ElevatedButton(
                onPressed: resetFields,
                child: const Text('Reset'),
              ),
              const SizedBox(height: 16.0),
              // Exibição do IMC calculado
              Text(
                'Seu IMC: ${imc.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Exibição da classificação do IMC
              Text(
                'Classificação: $result',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
