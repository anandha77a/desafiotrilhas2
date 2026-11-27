import 'package:desafiotrilhas2/perguntas.dart';
import 'package:desafiotrilhas2/quiz_engine.dart';

void main() {
  List ranking = [];
  bool continuarJogando = true;

  print('=========================================');
  print('BEM-VINDO AO QUIMICA CHALLENGE!');
  print('Teste seus conhecimentos sobre elementos,');
  print('reacoes e conceitos fundamentais da Quimica.');
  print('=========================================');

  while (continuarJogando) {
    String nomeJogador = solicitarNomeJogador();
    print('\nOla, $nomeJogador! Prepare-se, o quiz vai comecar...\n');

    var perguntas = List.from(obterPerguntasQuimica());
    perguntas.shuffle();

    int acertos = 0;
    int totalPerguntas = perguntas.length;

    for (int i = 0; i < totalPerguntas; i++) {
      var questaoAtual = perguntas[i] as Map;
      var alternativas = questaoAtual['alternativas'] as Map;

      print('-----------------------------------------');
      print('Pergunta ${i + 1} de $totalPerguntas:');
      print(questaoAtual['pergunta']);
      print('');
      print('  A) ${alternativas['A']}');
      print('  B) ${alternativas['B']}');
      print('  C) ${alternativas['C']}');
      print('  D) ${alternativas['D']}');
      print('');

      String respostaJogador = lerRespostaValida();
      String respostaCorreta = questaoAtual['correta'] as String;

      if (respostaJogador == respostaCorreta) {
        acertos++;
        print('Resposta correta, $nomeJogador!');
      } else {
        print(
          'Resposta incorreta! A alternativa correta era: $respostaCorreta) ${alternativas[respostaCorreta]}',
        );
      }
    }

    print('\n=========================================');
    print('RESULTADO FINAL DE ${nomeJogador.toUpperCase()}');
    print('Pontuacao: $acertos de $totalPerguntas perguntas corretas.');
    print(gerarMensagemDesempenho(nomeJogador, acertos, totalPerguntas));
    print('=========================================');

    ranking.add(ResultadoJogador(nomeJogador, acertos, totalPerguntas));

    exibirRanking(ranking);
    continuarJogando = perguntarJogarNovamente();
  }

  print('\nObrigado por jogar o Quimica Challenge! Ate a proxima!');
}
