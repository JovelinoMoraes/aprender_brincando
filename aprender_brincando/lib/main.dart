import 'package:flutter/material.dart';
import 'package:aprender_brincando/screens/animal_screen.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aprender Brincando',

      initialRoute: '/',

      routes: {
        '/': (context) => const AnimalScreen(), 
        '/animals': (context) => const AnimalScreen(),
      },
    );
  }
}
