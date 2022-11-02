import 'package:flutter/material.dart';
import '/components/generico/botao_telfone.dart';
import 'botao_sms.dart';

class PainelTelefone extends StatelessWidget {
  final VoidCallback funcaoTelefone;
  final VoidCallback funcaoSms;
  const PainelTelefone(
      {Key? key, required this.funcaoTelefone, required this.funcaoSms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SizedBox(
      width: largura / 4,
      child: Row(
        children: [
          BotaoTelefone(funcao: funcaoTelefone),
          BotaoSms(
            funcao: funcaoSms,
          ),
        ],
      ),
    );
  }
}
