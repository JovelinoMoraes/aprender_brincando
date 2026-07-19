import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final IconData icone;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.title,
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title, style: const TextStyle(fontSize: 20)),
    );
  }
}
