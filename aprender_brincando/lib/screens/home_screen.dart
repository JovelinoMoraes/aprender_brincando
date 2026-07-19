import 'package:flutter/material.dart';
import 'package:aprender_brincando/widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprender Brincando'),
        centerTitle: true,
      ),
      body: Center(
        child: MenuButton(
          title: 'Animais',
          icone: Icons.pets,
          onPressed: () {
            Navigator.pushNamed(context, '/animals');
            ;
          },
        ),
      ),
    );
  }
}
