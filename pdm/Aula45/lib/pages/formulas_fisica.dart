import 'package:flutter/material.dart';

class FormulasFisicas extends StatelessWidget {
  const FormulasFisicas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fórmulas de Física',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF063C73),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          _buildCategoryButton('Cinemática', [
            'Velocidade Média: v = ∆s / ∆t',
            'Aceleração Média: a = ∆v / ∆t',
            'Equação de Torricelli: v^2 = v0^2 + 2a∆s',
            // Adicione mais fórmulas de cinemática aqui...
          ]),
          _buildCategoryButton('Dinâmica', [
            'Segunda Lei de Newton: F = m * a',
            'Terceira Lei de Newton: F1 = -F2',
            // Adicione mais fórmulas de dinâmica aqui...
          ]),
          _buildCategoryButton('Termodinâmica', [
            'Primeira Lei da Termodinâmica: ∆U = Q - W',
            'Segunda Lei da Termodinâmica: ∆S ≥ 0',
            // Adicione mais fórmulas de termodinâmica aqui...
          ]),
          _buildCategoryButton('Eletromagnetismo', [
            'Lei de Ampère: ∮B * dl = μ0 * (ΣI + ε0 * dΦE/dt)',
            'Lei de Faraday: ε = -dΦB/dt',
            // Adicione mais fórmulas de eletromagnetismo aqui...
          ]),
          _buildCategoryButton('Óptica', [
            'Lei de Snell-Descartes: n1 * sen(θ1) = n2 * sen(θ2)',
            'Equação do Espelho Esférico: 1/f = 1/p + 1/p\'',
            // Adicione mais fórmulas de óptica aqui...
          ]),
          _buildCategoryButton('Ondulatória', [
            'Velocidade de uma Onda: v = λ * f',
            'Equação de Onda: y(x, t) = A * sin(kx - ωt)',
            // Adicione mais fórmulas de ondulatória aqui...
          ]),
          _buildCategoryButton('Gravitação', [
            'Lei da Gravitação Universal: F = G * (m1 * m2) / r^2',
            // Adicione mais fórmulas de gravitação aqui...
          ]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text('v1.0.1\nForksLabs ${DateTime.now().year}'),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, List<String> formulas) {
    return ExpansionTile(
      title: Text(title),
      children: formulas.map((formula) {
        return ListTile(
          title: Text(formula),
        );
      }).toList(),
    );
  }
}
