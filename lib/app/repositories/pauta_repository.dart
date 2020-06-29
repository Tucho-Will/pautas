import 'package:app/app/core/local_storage/database_helper.dart';
import 'package:app/app/core/response/response_defult.dart';
import 'package:app/app/interfaces/pauta_repository_interface.dart';
import 'package:app/app/interfaces/shared_repository_interface.dart';
import 'package:app/app/interfaces/user_repository_interface.dart';
import 'package:app/app/models/pauta.dart';
import 'package:app/app/models/user.dart';
import 'package:app/app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

class PautaRepository implements IPautaRepository {
  final table = 'pauta';
  IUserRepository _userRepository;
  ISharedRepositoryInterface _sharedRepository;

  PautaRepository() {
    _userRepository = new UserRepository();
    _sharedRepository = Modular.get<ISharedRepositoryInterface>();
  }

  @override
  Future<int> delete(Pauta pauta) async {
    Database db = await DatabaseHelper.database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [pauta.id],
    );
  }

  Future<List<Pauta>> queryAllByIdUsuario() async {
    Database db = await DatabaseHelper.database;
    //Como é utilizado o usuario logado para buscar as pautas
    Usuario usuario = await _sharedRepository.getUsuarioLogado();
    var result =
        await db.query(table, where: 'autor_id = ?', whereArgs: [usuario.id]);
    List<Pauta> list = result.isNotEmpty
        ? result.map((c) {
            var pauta = Pauta.fromMap(c);
            pauta.autor = usuario;
            return pauta;
          }).toList()
        : [];
    return list;
  }

  @override
  Future<DefaultResponse> insert(Pauta pauta) async {
    try {
      Database db = await DatabaseHelper.database;
      //0 -Aberta | 1- Finalizada
      pauta.status = 0;
      var idPauta = await db.insert(table, pauta.toMap());

      return DefaultResponse(
          object: idPauta,
          success: idPauta != null,
          message: 'Pauta criada com sucesso');
    } on Exception catch (e) {
      return DefaultResponse.Error(object: e, message: e.toString());
    }
  }

  @override
  Future<Pauta> queryById(int id) async {
    Database db = await DatabaseHelper.database;
    List<Map> maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      var pauta = Pauta.fromMap(maps.first);
      //Necessario recuperar o autor da pauta
      pauta.autor = await _userRepository.queryById(pauta.autor_id);
      return pauta;
    }
    return null;
  }

  @override
  Future<int> update(Pauta pauta) async {
    Database db = await DatabaseHelper.database;
    return await db
        .update(table, pauta.toMap(), where: 'id = ?', whereArgs: [pauta.id]);
  }
}
