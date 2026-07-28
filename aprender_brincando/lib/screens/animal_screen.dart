import '../data/animals_data.dart';
import 'package:flutter/material.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});
  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  int indiceAtual = 0;

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
                  style: TextStyle(
                    // estilização do nome do animal
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(offset: Offset(-1, -1), color: Colors.black),
                      const Shadow(offset: Offset(1, -1), color: Colors.black),
                      const Shadow(offset: Offset(1, 1), color: Colors.black),
                      const Shadow(offset: Offset(-1, 1), color: Colors.black),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    print('som do animal clicado');
                  },
                  child: const Text(
                    '🔊',
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
