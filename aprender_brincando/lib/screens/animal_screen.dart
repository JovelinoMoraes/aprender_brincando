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
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                width: 500,
                child: Image.asset(
                  animalAtual.imagem,
                  width: 1000,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ), // imagem do animal

              Container(
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                width: 350,
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
                        Shadow(offset: Offset(1, 2), color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Container(
                    //BOTAO ANTERIOR
                    decoration: BoxDecoration(
                      color: indiceAtual > 0
                          ? Colors.pink[400]
                          : Colors.grey[100],
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: indiceAtual > 0
                          ? () {
                              setState(() {
                                indiceAtual--;
                              });
                            }
                          : null,
                      icon: Icon(Icons.navigate_before_rounded),
                      color: Colors.white,
                      disabledColor: Colors.grey,
                    ),
                  ), // FIM BOTAO ANTERIOR

                  Container(
                    // BOTÂO DE SOM!
                    decoration: BoxDecoration(
                      color: Colors.pink[400],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        player.play(
                          AssetSource(animalAtual.som),
                        ); // ao clicar no botão a bliblitoca executa o audio
                      },
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ), // FIM BOTAO SOM
                  Container(
                    //BOTAO PROXIMO
                    decoration: BoxDecoration(
                      color: indiceAtual < animais.length - 1
                          ? Colors.pink[400]
                          : Colors.grey[100],
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: indiceAtual < (animais.length - 1)
                          ? () {
                              setState(() {
                                indiceAtual++;
                              });
                            }
                          : null,
                      icon: Icon(Icons.navigate_next_rounded),
                      color: Colors.white,
                      disabledColor: Colors.grey,
                    ),
                  ), // FIM BOTAO PROXIMO
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
