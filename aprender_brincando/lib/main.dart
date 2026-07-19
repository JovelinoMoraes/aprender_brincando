import 'screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aprender_brincando/screens/animals_screen.dart';

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
        '/': (context) => const HomeScreen(),
        '/animals': (context) => const AnimalsScreen(),
      },
    );
  }
}
