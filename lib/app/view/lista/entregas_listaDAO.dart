import 'package:entregas_application/dao/entregasDAO.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EntregasListaDAO extends StatelessWidget {
  EntregasListaDAO({Key? key}) : super(key: key);

  EntregasDAO entregasDAO = EntregasDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Entregas"),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    Navigator.pushNamed(context, '/entregasFormDAO'))
          ],
        ),
        body: FutureBuilder(
            // future: entregasDAO.EntregasDAO(),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          var lista = snapshot.data!;

          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var entregas = lista[contador];

                return ListTile(
                  title: Text(entregas["nome"].toString()),
                  subtitle: Text(entregas["descricao"].toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: const Color(0xffb74093),
                          onPressed: () {
                            Navigator.pushNamed(context, '/entregasFormDAO',
                                arguments: entregas);
                          },
                        )
                      ],
                    ),
                  ),
                );
              });
        }));
  }
}
