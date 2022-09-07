import 'package:entregas_application/banco/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Conexao {
  static Database? _db;

  static Future<Database> abrirConexao() async {
    if (_db == null) {
      String caminho = join(await getDatabasesPath(), 'banco.db');
      _db = await openDatabase(caminho, version: 1, onCreate: (db, version) {
        for (var comando in criarBanco) {
          db.execute(comando);
        }
      });
    }
    return _db!;
  }
}
