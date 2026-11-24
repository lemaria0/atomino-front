import 'package:atomino/ui/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:atomino/utils/colors.dart';
import 'package:atomino/ui/widgets/domino_tile.dart';
import 'package:atomino/ui/widgets/player_input.dart';
import 'package:atomino/ui/widgets/pixel_button.dart';
import 'package:atomino/ui/widgets/logo_atomo.dart';
import 'package:atomino/ui/widgets/screen_texture_painter.dart';
import 'package:atomino/ui/widgets/rule_heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel;

  final player1 = TextEditingController();
  final player2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    super.dispose();
  }

  void _startGame() {
    final started = viewModel.startGame(
      player1: player1.text,
      player2: player2.text,
    );

    if (!started) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('INSIRA OS NOMES DOS DOIS JOGADORES!'),
          backgroundColor: coral,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${player1.text.trim()} VS ${player2.text.trim()}',
        ),
        backgroundColor: green,
      ),
    );
  }

  void showHelp() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF101B2D),
          insetPadding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFF405B89), width: 2),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780, maxHeight: 680),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TÍTULO
                  const Text(
                    'REGRAS DO JOGO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE7EDF7),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // OBJETIVO
                  const RuleHeading(title: 'OBJETIVO'),

                  const SizedBox(height: 7),

                  const Text(
                    'Ser o primeiro jogador a jogar todas as peças.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB7C5D9),
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // NÍVEL FÁCIL
                  const RuleHeading(title: 'NÍVEL FÁCIL'),

                  const SizedBox(height: 7),

                  const Text(
                    'Para conectar duas peças, uma das extremidades '
                    'deve corresponder ao mesmo elemento químico. '
                    'A correspondência pode ser feita pelo Símbolo, '
                    'Nome, Número Atômico (Z) ou Massa Atômica (A).',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB7C5D9),
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // EXEMPLOS DE PEÇAS
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF205C50),
                        width: 5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        DominoTile(
                          left: 'Na',
                          right: 'Cl',
                          color: Color(0xFF83D58A),
                          shadowColor: Color(0xFF438B57),
                        ),
                        DominoTile(
                          left: 'C',
                          right: 'H',
                          color: Color(0xFFFFC74F),
                          shadowColor: Color(0xFFD58A32),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // INÍCIO DA PARTIDA E TURNOS
                  const Text(
                    'Começa o jogador que possuir a peça dupla '
                    'de Hidrogênio, os jogadores jogam '
                    'alternadamente. Se não houver peça '
                    'correspondente, o jogador passa a vez.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB7C5D9),
                      fontSize: 14,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 27),

                  // BOTÃO VOLTAR
                  SizedBox(
                    width: 190,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC247),
                        foregroundColor: const Color(0xFF101B2D),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: const BorderSide(
                            color: Color(0xFFFFE09B),
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'VOLTAR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: navy,
            border: Border.all(color: border, width: 3),
          ),
          child: Stack(
            children: [
              // TEXTURA DA TELA
              Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(painter: ScreenTexturePainter()),
                ),
              ),

              // MOLDURA INTERNA
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF263B59),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // BOTÃO DE AJUDA
              Positioned(
                top: 27,
                right: 27,
                child: PixelButton(
                  onTap: showHelp,
                  child: const Text(
                    '?',
                    style: TextStyle(
                      color: cyan,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // CONTEÚDO PRINCIPAL
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 45,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 410),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // LOGO
                        const LogoAtomo(),

                        const SizedBox(height: 15),

                        // SEPARADOR
                        const Row(
                          children: [
                            Expanded(child: Divider(color: border)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'PLAYER SELECT',
                                style: TextStyle(
                                  color: yellow,
                                  fontSize: 10,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: border)),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // PAINEL DOS JOGADORES
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: navyLight,
                            border: Border.all(color: border, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              PlayerInput(
                                label: 'P1',
                                color: cyan,
                                controller: player1,
                              ),

                              const SizedBox(height: 20),

                              // SEPARADOR ENTRE OS JOGADORES
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(color: Color(0xFF354A68)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      'VS',
                                      style: TextStyle(
                                        color: muted.withOpacity(0.7),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(color: Color(0xFF354A68)),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              PlayerInput(
                                label: 'P2',
                                color: coral,
                                controller: player2,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // BOTÃO INICIAR
                        SizedBox(
                          width: 220,
                          height: 57,
                          child: ElevatedButton(
                            onPressed: _startGame,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellow,
                              foregroundColor: navy,
                              elevation: 5,
                              shadowColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(
                                  color: Color(0xFFFFDF91),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_arrow_rounded, size: 23),
                                SizedBox(width: 7),
                                Text(
                                  'INICIAR',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 17),

                        const Text(
                          'PRESS START TO PLAY',
                          style: TextStyle(
                            color: muted,
                            fontSize: 9,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // DIFICULDADE
              Positioned(
                bottom: 27,
                right: 27,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: green,
                    border: Border.all(
                      color: const Color(0xFF4D927B),
                      width: 2,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'FÁCIL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
