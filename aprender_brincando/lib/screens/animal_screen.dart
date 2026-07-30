import '../data/animals_data.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});
  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  int indiceAtual = 0;
  final AudioPlayer player = AudioPlayer(); // player de audio dos animais

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animalAtual = animais[indiceAtual];
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: Image.asset(
                animalAtual.imagem,
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ), // imagem do animal

            SizedBox(
              width: 400,
              height: 100,
              child: FittedBox(
                child: Text(
                  animalAtual.nome, // nome do animal
                  style: const TextStyle(
                    // estilização do nome do animal
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(offset: Offset(-1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, -1), color: Colors.black),
                      Shadow(offset: Offset(1, 1), color: Colors.black),
                      Shadow(offset: Offset(-1, 1), color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  // botão anterior
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: indiceAtual > 0
                      ? () {
                          setState(() {
                            indiceAtual--;
                          });
                        }
                      : null,
                  child: const Text(
                    '◀', // icone botão anterior
                    style: TextStyle(fontSize: 35, color: Colors.pink),
                  ),
                ),
                ElevatedButton(
                  /// botão do som do animal
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    player.play(
                      AssetSource(animalAtual.som),
                    ); // ao clicar no botão a bliblitoca executa o audio
                  },
                  child: const Text(
                    '🔊', // icone do botão do som
                    style: TextStyle(fontSize: 35, color: Colors.pink),
                  ),
                ), // botao de play audio
                ElevatedButton(
                  // botão proximo
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: indiceAtual < (animais.length - 1)
                      ? () {
                          setState(() {
                            indiceAtual++;
                          });
                        }
                      : null,
                  child: const Text(
                    '▶', // icone botao proximo
                    style: TextStyle(fontSize: 35, color: Colors.pink),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
