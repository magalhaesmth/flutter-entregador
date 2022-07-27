import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EntregasForm extends StatelessWidget {
  int? id;
  String? nome;
  String? descricao;

  EntregasForm({Key? key}) : super(key: key);

  Future<int> salvar() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(path, version: 1);
    String sql;
    Future<int> linhasAfetadas;
    if (id == null) {
      sql = 'INSERT INTO entregas (nome, descricao) VALUES (?,?)';
      linhasAfetadas = database.rawInsert(sql, [nome, descricao]);
    } else {
      sql = 'UPDATE entregas SET nome = ?, descricao=? WHERE id=?';
      linhasAfetadas = database.rawUpdate(sql, [nome, descricao, id]);
    }
    return linhasAfetadas;
  }

  Widget criarCampo(String rotulo, String? dica,
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
      Map<String, Object?> entregas = argumento as Map<String, Object?>;
      id = entregas['id'] as int;
      nome = entregas['nome'] as String;
      descricao = entregas['descricao'] as String;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Entregas"),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  salvar();
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Form(
          child: Column(
            children: [
              criarCampo("Nome", "Informe o nome do Restaurante",
                  (valorDigitado) => nome = valorDigitado, nome),
              criarCampo("Descrição", "Informe a taxa de entrega",
                  (valorDigitado) => descricao = valorDigitado, descricao),
            ],
          ),
        ));
  }
}
