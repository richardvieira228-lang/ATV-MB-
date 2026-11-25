import 'package:flutter/material.dart';
import 'tela2.dart';

class Tela1 extends StatelessWidget {
  Tela1({super.key});

  final nomeOrganizador = TextEditingController();
  final quantidadeTimes = TextEditingController();
  final duracaoEvento = TextEditingController();

  void avancar(BuildContext context) {
    final nome = nomeOrganizador.text;
    final times = int.tryParse(quantidadeTimes.text) ?? 0;
    final dias = int.tryParse(duracaoEvento.text) ?? 0;

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Informe o nome do organizador")),
      );
      return;
    }

    if (times <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("A quantidade de times deve ser maior que zero")),
      );
      return;
    }

    if (dias <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("A duração do evento deve ser maior que zero")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela2(
          nomeOrganizador: nome,
          quantidadeTimes: times,
          duracaoEvento: dias,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuração do Campeonato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeOrganizador,
              decoration: const InputDecoration(
                labelText: "Nome do organizador",
              ),
            ),
            TextField(
              controller: quantidadeTimes,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantidade de times",
              ),
            ),
            TextField(
              controller: duracaoEvento,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Duração do evento (dias)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                avancar(context);
              },
              child: const Text("Avançar para Infraestrutura"),
            ),
          ],
        ),
      ),
    );
  }
}