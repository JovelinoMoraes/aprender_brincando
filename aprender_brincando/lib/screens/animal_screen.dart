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
    return Scaffold(body: Center(
      child: Column(
        children: [
          Text(animais[indiceAtual].nome),
          Row(children: [
            ElevatedButton(onPressed: (){}, child:Text('Anterior')),
            ElevatedButton(onPressed: (){}, child:Text('Próximo')),
          ],)
        ],
      ),
    ));
  }
}
