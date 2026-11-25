import 'package:flutter/material.dart';
import 'tela4.dart';

class Tela3 extends StatelessWidget {
  final String nomeOrganizador;
  final int quantidadeTimes;
  final int duracaoEvento;
  final int totalJogadores;
  final double custoInfraestrutura;
  final double custoPremiacao;
  final double custoAlimentacao;
  final double custoOperacionalBruto;

  Tela3({
    super.key,
    required this.nomeOrganizador,
    required this.quantidadeTimes,
    required this.duracaoEvento,
    required this.totalJogadores,
    required this.custoInfraestrutura,
    required this.custoPremiacao,
    required this.custoAlimentacao,
    required this.custoOperacionalBruto,
  });

  final arrecadacaoTotal = TextEditingController();
  final taxaUsoBanda = TextEditingController();

  void avancar(BuildContext context) {
    final arrecadacao = double.tryParse(arrecadacaoTotal.text) ?? 0;
    final taxaBanda = double.tryParse(taxaUsoBanda.text) ?? 0;

    final saldoFinal = arrecadacao - custoOperacionalBruto;
    final fatorEstresse = (taxaBanda / 10) * duracaoEvento;
    final riscoLag = taxaBanda > 85;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tela4(
          nomeOrganizador: nomeOrganizador,
          quantidadeTimes: quantidadeTimes,
          duracaoEvento: duracaoEvento,
          totalJogadores: totalJogadores,
          custoInfraestrutura: custoInfraestrutura,
          custoPremiacao: custoPremiacao,
          custoAlimentacao: custoAlimentacao,
          custoOperacionalBruto: custoOperacionalBruto,
          arrecadacaoTotal: arrecadacao,
          saldoFinal: saldoFinal,
          taxaUsoBanda: taxaBanda,
          fatorEstresse: fatorEstresse,
          riscoLag: riscoLag,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arrecadação e Transmissão"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: arrecadacaoTotal,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Arrecadação total (R\$)",
              ),
            ),
            TextField(
              controller: taxaUsoBanda,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Taxa de uso da banda (%)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                avancar(context);
              },
              child: const Text("Gerar Relatório Final"),
            ),
          ],
        ),
      ),
    );
  }
}