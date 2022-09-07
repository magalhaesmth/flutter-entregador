import 'package:entregas_application/dao/entregasDAO.dart';
import 'package:entregas_application/model/entregas.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EntregasFormDAO extends StatelessWidget {
  dynamic id;
  String? nome;
  String? descricao;

  EntregasDAO entregasDAO = EntregasDAO();
  //entregasDAO.salvarDAO =

  EntregasFormDAO({Key? key}) : super(key: key);

  Widget _criarCampo(String rotulo, String? dica,
      ValueChanged<String>? vincularValor, String? valorInicial) {
    return TextFormField(
      decoration: InputDecoration(label: Text(rotulo), hintText: dica),
      onChanged: vincularValor,
      initialValue: valorInicial ??= '',
    );
  }

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> tarefa = argumento as Map<String, Object?>;
      id = tarefa['id'] as int;
      nome = tarefa['nome'] as String;
      descricao = tarefa['descricao'] as String;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Entrega'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  entregasDAO
                      .salvarDAO(Entregas(nome: nome!, descricao: descricao!));
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Form(
          child: Column(children: [
            _criarCampo('Nome', 'Nome do Restaurante',
                (valorDigitado) => nome = valorDigitado, nome),
            _criarCampo('Descrição', 'Valor da Entrega',
                (valorDigitado) => descricao = valorDigitado, descricao),
          ]),
        ));
  }
}
