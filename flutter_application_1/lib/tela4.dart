import 'package:flutter/material.dart';
import 'tela1.dart';

class Tela4 extends StatelessWidget {
  final String nomeOrganizador;
  final int quantidadeTimes;
  final int duracaoEvento;
  final int totalJogadores;
  final double custoInfraestrutura;
  final double custoPremiacao;
  final double custoAlimentacao;
  final double custoOperacionalBruto;
  final double arrecadacaoTotal;
  final double saldoFinal;
  final double taxaUsoBanda;
  final double fatorEstresse;
  final bool riscoLag;

  const Tela4({
    super.key,
    required this.nomeOrganizador,
    required this.quantidadeTimes,
    required this.duracaoEvento,
    required this.totalJogadores,
    required this.custoInfraestrutura,
    required this.custoPremiacao,
    required this.custoAlimentacao,
    required this.custoOperacionalBruto,
    required this.arrecadacaoTotal,
    required this.saldoFinal,
    required this.taxaUsoBanda,
    required this.fatorEstresse,
    required this.riscoLag,
  });

  String statusFinal() {
    if (saldoFinal >= 0 && taxaUsoBanda <= 85) {
      return "Evento de Sucesso Absoluto (Sem Lag e Com Lucro)";
    } else if (saldoFinal >= 0 && taxaUsoBanda > 85) {
      return "Lucrativo, mas com Instabilidade de Rede";
    } else {
      return "Evento Prejudicial (Prejuízo Financeiro)";
    }
  }

  void novoCampeonato(BuildContext context) {
    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Tela1(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Relatório Final"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Organizador: $nomeOrganizador",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("Total de jogadores: $totalJogadores"),
              const SizedBox(height: 15),

              const Text(
                "Resumo logístico",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Times participantes: $quantidadeTimes"),
              Text("Duração do evento: $duracaoEvento dias"),
              const SizedBox(height: 15),

              const Text(
                "Discriminação financeira",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Infraestrutura: R\$ ${custoInfraestrutura.toStringAsFixed(2)}"),
              Text("Premiação: R\$ ${custoPremiacao.toStringAsFixed(2)}"),
              Text("Alimentação: R\$ ${custoAlimentacao.toStringAsFixed(2)}"),
              Text("Custo operacional bruto: R\$ ${custoOperacionalBruto.toStringAsFixed(2)}"),
              const SizedBox(height: 15),

              const Text(
                "Resultado financeiro",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Arrecadação total: R\$ ${arrecadacaoTotal.toStringAsFixed(2)}"),
              Text(
                "Saldo final: R\$ ${saldoFinal.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: saldoFinal < 0 ? Colors.red : Colors.green,
                ),
              ),
              if (saldoFinal < 0)
                const Text(
                  "Atenção: Deficit Financeiro Detectado!",
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 15),

              const Text(
                "Infraestrutura de rede",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Fator de estresse dos servidores: ${fatorEstresse.toStringAsFixed(2)}"),
              if (riscoLag)
                const Text(
                  "Alerta: risco alto de lag na transmissão",
                  style: TextStyle(color: Colors.orange),
                ),
              const SizedBox(height: 20),

              Text(
                "Status final: ${statusFinal()}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  novoCampeonato(context);
                },
                child: const Text("Novo Campeonato"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}