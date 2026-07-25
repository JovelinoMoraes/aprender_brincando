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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(animais[indiceAtual].nome),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: indiceAtual > 0
                      ? () {
                          setState(() {
                            indiceAtual--;
                          });
                        }
                      : null,
                  child: const Text('◀  Anterior'),
                ),
                ElevatedButton(
                  onPressed: indiceAtual < (animais.length - 1)
                      ? () {
                          setState(() {
                            indiceAtual++;
                          });
                        }
                      : null,
                  child: const Text('Próximo  ▶'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
