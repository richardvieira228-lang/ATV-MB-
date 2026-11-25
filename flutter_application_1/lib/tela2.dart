import 'package:flutter/material.dart';
import 'tela3.dart';

class Tela2 extends StatelessWidget {
  final String nomeOrganizador;
  final int quantidadeTimes;
  final int duracaoEvento;

  Tela2({
    super.key,
    required this.nomeOrganizador,
    required this.quantidadeTimes,
    required this.duracaoEvento,
  });

  final jogadoresPorTime = TextEditingController();
  final premiacaoPorTime = TextEditingController();
  final custoDiarioPorJogador = TextEditingController();

  void avancar(BuildContext context) {
    final jogadores = int.tryParse(jogadoresPorTime.text) ?? 0;
    final premiacao = double.tryParse(premiacaoPorTime.text) ?? 0;
    final custoDiario = double.tryParse(custoDiarioPorJogador.text) ?? 0;

    if (jogadores <= 0 || premiacao <= 0 || custoDiario <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos com valores maiores que zero")),
      );
      return;
    }

    final totalJogadores = quantidadeTimes * jogadores;
    final custoInfraestrutura = totalJogadores * custoDiario * duracaoEvento;
    final custoPremiacao = quantidadeTimes * premiacao;
    final custoAlimentacao = totalJogadores * duracaoEvento * 40.00;
    final custoOperacionalBruto = custoInfraestrutura + custoPremiacao + custoAlimentacao;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela3(
          nomeOrganizador: nomeOrganizador,
          quantidadeTimes: quantidadeTimes,
          duracaoEvento: duracaoEvento,
          totalJogadores: totalJogadores,
          custoInfraestrutura: custoInfraestrutura,
          custoPremiacao: custoPremiacao,
          custoAlimentacao: custoAlimentacao,
          custoOperacionalBruto: custoOperacionalBruto,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infraestrutura e Premiação"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: jogadoresPorTime,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Jogadores por time",
              ),
            ),
            TextField(
              controller: premiacaoPorTime,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Premiação por time (R\$)",
              ),
            ),
            TextField(
              controller: custoDiarioPorJogador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Custo diário por jogador (R\$)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                avancar(context);
              },
              child: const Text("Avançar para Arrecadação"),
            ),
          ],
        ),
      ),
    );
  }
}