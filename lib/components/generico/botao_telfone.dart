import 'package:flutter/material.dart';

class BotaoTelefone extends StatelessWidget {
  final VoidCallback funcao;
  const BotaoTelefone({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.phone),
      color: Colors.teal,
      onPressed: funcao,
    );
  }
}
