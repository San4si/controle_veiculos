import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Veículos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Controle de Veículos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Controle de Veículos 🚗',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroVeiculoPage(),
                  ),
                );
              },
              child: const Text('Adicionar Veículo'),
            ),
          ],
        ),
      ),
    );
  }
}
class CadastroVeiculoPage extends StatefulWidget {
  const CadastroVeiculoPage({super.key});

  @override
  State<CadastroVeiculoPage> createState() => _CadastroVeiculoPageState();
}

class _CadastroVeiculoPageState extends State<CadastroVeiculoPage> {
  final TextEditingController _modeloController = TextEditingController();
   List<String> _veiculos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(
                labelText: 'Modelo do veículo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String modelo = _modeloController.text;
                  if (modelo.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, insira um modelo válido.'),
                      ),
                    );
                    return;
                  }
                  setState(() {
                  _veiculos.add(modelo);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Veículo "$modelo" salvo com sucesso!'),
                    ),
                  );
                  _modeloController.clear();
                },
                child: const Text('Salvar Veículo'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Veículos Cadastrados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ..._veiculos.map((veiculo) => Text(veiculo)).toList(),
          ],
        ),
      ),
    );
  }
}
