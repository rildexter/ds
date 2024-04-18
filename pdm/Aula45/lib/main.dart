import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'pages/formulas_fisica.dart';
import 'pages/formulas_quimica.dart';
import 'pages/formulas_matematica.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          //removendo o debug
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: themeProvider.themeMode,
          home: const TodasFormulas(),
          routes: {
            '/formulas_fisica': (context) => const FormulasFisicas(),
            '/formulas_quimica': (context) => const FormulasQuimica(),
            '/formulas_matematica': (context) => const FormulasMatematica(),
          },
        );
      },
    );
  }
}

class TodasFormulas extends StatelessWidget {
  const TodasFormulas({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todas as Fórmulas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF063C73),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6, color: Colors.white),
            onPressed: () {
              ThemeMode newMode = themeProvider.themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              themeProvider.setThemeMode(newMode);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildCategoryButton(context, 'Física', '/formulas_fisica'),
          _buildCategoryButton(context, 'Química', '/formulas_quimica'),
          _buildCategoryButton(context, 'Matemática', '/formulas_matematica'),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'v1.0.0\nForksLabs ${DateTime.now().year}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
