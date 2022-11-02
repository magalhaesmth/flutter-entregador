import 'package:flutter/material.dart';
import '/components/painel_telefone.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoTelefone extends StatelessWidget {
  const CartaoTelefone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Contato:'),
        subtitle: const Text('(44)998033233'),
        trailing: PainelTelefone(
          funcaoTelefone: chamarTelefone,
          funcaoSms: chamarSms,
        ),
      ),
    );
  }

  chamarTelefone() {
    launchUrl(Uri(scheme: 'tel', path: '(44)998033233'));
  }

  chamarSms() {
    launchUrl(Uri(scheme: 'sms', path: '(44)998033233'));
  }
}
