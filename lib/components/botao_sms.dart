import 'package:flutter/material.dart';

class BotaoSms extends StatelessWidget {
  final VoidCallback funcao;
  const BotaoSms({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.message),
      color: Colors.teal,
      onPressed: funcao,
    );
  }
}
