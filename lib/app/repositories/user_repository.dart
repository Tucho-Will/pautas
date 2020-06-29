import 'package:app/app/core/local_storage/database_helper.dart';
import 'package:app/app/interfaces/user_repository_interface.dart';
import 'package:app/app/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository implements IUserRepository {
  final table = 'usuario';

  @override
  Future<int> delete(Usuario user) async {
    Database db = await DatabaseHelper.database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  @override
  Future<int> insert(Usuario user) async {
    Database db = await DatabaseHelper.database;
    return await db.insert(table, user.toMap());
  }

  @override
  Future<Usuario> queryById(int id) async {
    Database db = await DatabaseHelper.database;
    List<Map> maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Usuario.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<Usuario> queryByEmailAndSenha(String email, String senha) async {
    Database db = await DatabaseHelper.database;
    List<Map> maps = await db.query(table,
        where: 'email = ? and senha = ? ', whereArgs: [email, senha]);
    if (maps.length > 0) {
      return Usuario.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<Usuario> queryByEmail(String email) async {
    Database db = await DatabaseHelper.database;
    List<Map> maps =
        await db.query(table, where: 'email = ? ', whereArgs: [email]);
    if (maps.length > 0) {
      return Usuario.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<int> update(Usuario user) async {
    Database db = await DatabaseHelper.database;
    return await db
        .update(table, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }
}
