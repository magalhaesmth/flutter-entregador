import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EntregasListaDinamica extends StatefulWidget {
  const EntregasListaDinamica({Key? key}) : super(key: key);

  @override
  State<EntregasListaDinamica> createState() => _EntregasListaDinamicaState();
}

class _EntregasListaDinamicaState extends State<EntregasListaDinamica> {
  Future<List<Map<String, Object?>>> consultarDois() async {
    String caminho = join(await getDatabasesPath(), 'banco.db');
    Database bd = await openDatabase(
      caminho,
      onCreate: (db, version) {
        db.execute('');
      },
    );

    List<Map<String, Object?>> dados =
        await bd.rawQuery('SELECT * FROM entregas');
    return dados;
  }

  Future<List<Map<String, Object?>>> consultar() async {
    await Future.delayed(const Duration(seconds: 3));
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(
            'CREATE TABLE entregas (id INTEGER PRIMARY KEY, nome TEXT, descricao TEXT)');
        db.execute(
            'INSERT INTO entregas (nome, descricao) VALUES("Arabis Esfirras","6,00")');
        db.execute(
            'INSERT INTO entregas (nome, descricao) VALUES("ItoHookah","4,00")');
        db.execute(
            'INSERT INTO entregas (nome, descricao) VALUES("DogKing","8,00")');
      },
    );
    List<Map<String, Object?>> list =
        await database.rawQuery('SELECT * FROM entregas');
    return list;
  }

  Future<int> excluir(int id) async {
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(path, version: 1);
    int linhasAfetadas =
        await database.rawDelete('DELETE FROM entregas WHERE id = ?', [id]);
    setState(() {});
    return linhasAfetadas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Entregas Realizadas'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, '/entregasForm').then((value) {
                      setState(() {});
                    })),
          ],
        ),
        body: FutureBuilder(
            future: consultar(),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var listaEntregas = snapshot.data!;
              return ListView.builder(
                  itemCount: listaEntregas.length,
                  itemBuilder: (context, contador) {
                    var entregas = listaEntregas[contador];
                    return ListTile(
                      title: Text(entregas["nome"].toString()),
                      subtitle: Text(entregas["descricao"].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.pushNamed(context, '/entregasForm',
                                        arguments: entregas)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                excluir(entregas['id'] as int);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
