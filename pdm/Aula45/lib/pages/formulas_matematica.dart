import 'package:flutter/material.dart';



class FormulasMatematica extends StatelessWidget {
  const FormulasMatematica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fórmulas de Matemática',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF063C73),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          _buildCategoryButton('Álgebra', [
            'Equação de 1º Grau: ax + b = 0',
            'Equação de 2º Grau: ax² + bx + c = 0',
            'Fórmula de Bhaskara: x = (-b ± √Δ) / 2a',
            'Equação do Segundo Grau: ax^2 + bx + c = 0',
            'Soma dos Termos de uma PA: S = (n * (a1 + an)) / 2',
          ]),
          _buildCategoryButton('Geometria', [
            'Área do Triângulo: A = (base * altura) / 2',
            'Área do Círculo: A = π * raio²',
            'Volume do Cubo: V = aresta³',
            'Perímetro do Quadrado: P = 4 * lado',
            'Diagonal do Quadrado: d = lado * √2',
          ]),
          _buildCategoryButton('Trigonometria', [
            'Seno: sen(θ) = oposto / hipotenusa',
            'Cosseno: cos(θ) = adjacente / hipotenusa',
            'Tangente: tan(θ) = oposto / adjacente',
            'Identidade Fundamental: sen²(θ) + cos²(θ) = 1',
            'Lei dos Senos: a/sen(α) = b/sen(β) = c/sen(γ)',
          ]),
          _buildCategoryButton('Cálculo', [
            'Derivada: f\'(x) = lim(h->0) [f(x + h) - f(x)] / h',
            'Integral: ∫ f(x) dx',
            'Teorema Fundamental do Cálculo: ∫[a, b] f(x) dx = F(b) - F(a)',
            'Regra da Cadeia: (f ∘ g)\'(x) = f\'(g(x)) * g\'(x)',
            'Integração por Partes: ∫ u dv = uv - ∫ v du',
          ]),
          _buildCategoryButton('Geometria Analítica', [
            'Distância entre Dois Pontos: d = √((x2 - x1)² + (y2 - y1)²)',
            'Equação da Reta: y = mx + c',
            'Equação da Circunferência: (x - h)² + (y - k)² = r²',
            'Área do Triângulo: A = |x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)| / 2',
            'Equação da Elipse: (x - h)²/a² + (y - k)²/b² = 1',
          ]),
          _buildCategoryButton('Probabilidade e Estatística', [
            'Média Aritmética: média = Σx / n',
            'Desvio Padrão: σ = √(Σ(xi - μ)² / n)',
            'Coeficiente de Correlação: r = Σ((xi - x̄)(yi - ȳ)) / √(Σ(xi - x̄)² * Σ(yi - ȳ)²)',
            'Teorema de Bayes: P(A|B) = (P(B|A) * P(A)) / P(B)',
            'Distribuição Normal: f(x) = (1 / (σ * √(2π))) * e^(-((x - μ)² / (2σ²)))',
          ]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text('ForkLabs ${DateTime.now().year}',
          textAlign: TextAlign.center,),
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

class FormulasFisica extends StatelessWidget {
  const FormulasFisica({super.key});

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

