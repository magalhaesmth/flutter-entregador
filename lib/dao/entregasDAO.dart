import 'package:entregas_application/banco/conexao.dart';
import 'package:entregas_application/model/entregas.dart';
import 'package:sqflite/sqflite.dart';

class EntregasDAO {
  Future<bool> salvarDAO(Entregas entregas) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO entregas (id, nome, descricao) VALUES (?,?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [entregas.id, entregas.nome, entregas.descricao.toString()]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarDAO(Entregas entregas) async {
    const sql = 'UPDATE entregas SET nome=?, endereco=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db
        .rawUpdate(sql, [entregas.nome, entregas.descricao, entregas.id]);
    return linhasAfetadas > 0;
  }

  Future<Entregas> consultarDAO(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM entregas WHERE id = ?';
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este ID');
      Entregas entregas = Entregas(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          descricao: resultado['descricao'].toString());
      return entregas;
    } catch (e) {
      throw Exception('classe EntregasDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluirDAO(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM entregas WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe EntregasDAO, método excluir');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<Entregas>> listar() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM tarefa';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Entregas> tarefas = resultado.map((linha) {
        return Entregas(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            descricao: linha['descricao'].toString());
      }).toList();
      return tarefas;
    } catch (e) {
      throw Exception('classe TarefaDAOSQLite, método listar');
    } finally {
      db.close();
      @override
      Future<List<Entregas>> listar() async {
        late Database db;
        try {
          const sql = 'SELECT * FROM tarefa';
          db = await Conexao.abrirConexao();
          List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
          if (resultado.isEmpty) throw Exception('Sem registros');
          List<Entregas> tarefas = resultado.map((linha) {
            return Entregas(
                id: linha['id'] as int,
                nome: linha['nome'].toString(),
                descricao: linha['descricao'].toString());
          }).toList();
          return tarefas;
        } catch (e) {
          throw Exception('classe TarefaDAOSQLite, método listar');
        } finally {
          db.close();
        }
      }
    }
  }
}
