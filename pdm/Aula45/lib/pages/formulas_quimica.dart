import 'package:flutter/material.dart';

class FormulasQuimica extends StatelessWidget {
  const FormulasQuimica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fórmulas Química',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF063C73),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          _buildCategoryButton('Termoquímica', [
            'Entalpia de Formação: ∆H = ΣH produtos - ΣH reagentes',
            'Lei de Hess: ∆H = ΣH produtos - ΣH reagentes',
            'Energia de Ativação: Ea = ∆H - ∆G',
            'Calor Específico: q = mc∆T',
            'Entalpia de Ligação: ∆H = ΣH ligações quebradas - ΣH ligações formadas',
            'Lei de Kirchhoff: ∆H = ∆H° + ∆Cp (T - T°)',
            'Regra das fases de Gibbs: F = C - P + 2',
          ]),
          _buildCategoryButton('Cinética Química', [
            'Lei da Velocidade de Reação: v = k[A]^m[B]^n',
            'Ordem de Reação: n = ∆[A] / ∆t',
            'Lei de Arrhenius: k = A * e^(-Ea/RT)',
            'Fator de Frequência: A = Z * e^(-Ea/RT)',
            'Tempo de Meia-Vida: t1/2 = 0.693 / k',
            'Frequência de Colisão: Z = (4πN * (dA + dB)^2)^(1/2)',
            'Teoria das Colisões: A colisão é efetiva quando as moléculas têm energia cinética suficiente e a orientação correta.',
          ]),
          _buildCategoryButton('Equilíbrio Químico', [
            'Constante de Equilíbrio: Kc = [C]^c[D]^d / [A]^a[B]^b',
            'Lei de Le Chatelier: "Se uma perturbação for aplicada a um sistema em equilíbrio, o sistema se ajustará para minimizar o efeito da perturbação."',
            'Deslocamento de Equilíbrio: A adição de reagentes ou produtos desloca o equilíbrio na direção oposta.',
            'Princípio de Le Chatelier: Quando uma mudança de concentração, temperatura, volume ou pressão é aplicada a um sistema em equilíbrio, o sistema se ajusta para neutralizar a mudança, alcançando um novo equilíbrio.',
            'Equilíbrio Iônico da Água: Kw = [H+][OH-]',
            'Produto de Solubilidade: Ksp = [A]^a[B]^b',
            'Lei de ação das massas: A quantidade de reagentes e produtos em um estado de equilíbrio é determinada pela razão de suas concentrações elevadas às suas estequiometrias.',
          ]),
          _buildCategoryButton('Eletroquímica', [
            'Lei de Faraday: n = Q / (z * F)',
            'Potencial Padrão de Eletrodo: E° = E°cátodo - E°ânodo',
            'Equação de Nernst: E = E° - (0.0592 / n) * log(Q)',
            'Célula Galvânica: Produz energia elétrica a partir de reações de oxidação e redução espontâneas.',
            'Eletrólise: Processo de decomposição de uma substância por meio de uma corrente elétrica.',
            'Corrosão: Degradação de um metal devido à reação com o meio ambiente.',
            'Pilha de Daniell: Uma célula eletroquímica que consiste em um eletrodo de zinco e um eletrodo de cobre em soluções de seus próprios íons.',
          ]),
          _buildCategoryButton('Estequiometria', [
            'Lei de Lavoisier: Na natureza, nada se cria, nada se perde, tudo se transforma.',
            'Estequiometria de Reações Químicas: nA + mB -> pC + qD',
            'Rendimento: %Rendimento = (massa experimental / massa teórica) * 100%',
            'Número de Avogadro: 1 mol de qualquer substância contém aproximadamente 6.022 x 10^23 partículas.',
            'Relação Mol-Mol: A relação entre as quantidades de reagentes e produtos em uma reação química.',
            'Massa Molar: Massa de um mol de átomos, moléculas ou íons de uma substância.',
            'Volume Molar: Volume ocupado por um mol de qualquer gás em condições padrão de pressão e temperatura (STP).',
          ]),
          _buildCategoryButton('Química Orgânica', [
            'Nomenclatura de Compostos Orgânicos: Alcanos, Alcenos, Alcinos, etc.',
            'Reações de Substituição: Sustituição Nucleofílica e Eletrofílica',
            'Reações de Adição: Adição de Hidrogênio, Adição de Halogênios, etc.',
            'Reações de Eliminação: Eliminação de Água, Eliminação de Halogênios, etc.',
            'Isomeria: Isomeria Estrutural, Isomeria Geométrica, Isomeria Óptica',
            'Hibridação: sp, sp2, sp3, sp3d, sp3d2',
            'Grupos Funcionais: Hidroxila, Carbônica, Carboxila, Amino, etc.',
          ]),
          // Adicione mais categorias e fórmulas conforme necessário
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

