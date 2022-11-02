import 'package:flutter/material.dart';

class BotaoEmail extends StatelessWidget {
  final VoidCallback funcao;
  const BotaoEmail({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.email),
      color: Colors.teal,
      onPressed: funcao,
    );
  }
}
