import 'dart:io';

class ResultadoJogador {
  final String nome;
  final int acertos;
  final int total;

  ResultadoJogador(this.nome, this.acertos, this.total);
}

String solicitarNomeJogador() {
  while (true) {
    stdout.write('\nDigite seu nome para comecar: ');
    String? entrada = stdin.readLineSync();

    if (entrada != null && entrada.trim().isNotEmpty) {
      return entrada.trim();
    }
    print('Nome invalido! Digite pelo menos um caractere.');
  }
}

String lerRespostaValida() {
  const opcoesValidas = ['A', 'B', 'C', 'D'];

  while (true) {
    stdout.write('Sua resposta (A, B, C ou D): ');
    String? entrada = stdin.readLineSync();

    if (entrada != null) {
      String respostaFormatada = entrada.trim().toUpperCase();
      if (opcoesValidas.contains(respostaFormatada)) {
        return respostaFormatada;
      }
    }
    print('Opcao invalida! Digite apenas A, B, C ou D.');
  }
}

String gerarMensagemDesempenho(String nome, int acertos, int total) {
  double percentual = (acertos / total) * 100;

  if (percentual == 100) {
    return 'Incrivel, $nome! Gabaritou! Otimo dominio de Quimica!';
  } else if (percentual >= 70) {
    return 'Mandou muito bem, $nome! Excelente desempenho em Quimica!';
  } else if (percentual >= 50) {
    return 'Bom trabalho, $nome! Voce acertou metade ou mais, continue praticando!';
  } else {
    return 'Nao desanime, $nome! Que tal revisar os conteudos e tentar novamente?';
  }
}

bool perguntarJogarNovamente() {
  while (true) {
    stdout.write('\nDeseja jogar novamente? (S/N): ');
    String? entrada = stdin.readLineSync();

    if (entrada != null) {
      String opcao = entrada.trim().toUpperCase();
      if (opcao == 'S' || opcao == 'SIM') return true;
      if (opcao == 'N' || opcao == 'NAO' || opcao == 'NAO') return false;
    }
    print('Digite S para Sim ou N para Nao.');
  }
}

void exibirRanking(List ranking) {
  if (ranking.isEmpty) return;

  ranking.sort((a, b) => (b.acertos as int).compareTo(a.acertos as int));

  print('\n=========================================');
  print('RANKING DE JOGADORES DA SESSAO');
  print('=========================================');

  for (int i = 0; i < ranking.length; i++) {
    var registro = ranking[i];
    print(
      '${i + 1}o lugar: ${registro.nome} - ${registro.acertos}/${registro.total} acertos',
    );
  }
  print('=========================================');
}
