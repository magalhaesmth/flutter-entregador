import 'package:flutter/material.dart';
import '/components/cartao_email.dart';
import '/components/cartao_nome.dart';
import 'components/cartao_telefone.dart';
import 'components/meu_avatar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: const [
          MeuAvatar(),
          CartaoNome(),
          CartaoTelefone(),
          CartaoEmail()
        ],
      ),
    );
  }
}
