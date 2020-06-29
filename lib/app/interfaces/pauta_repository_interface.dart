import 'package:app/app/core/response/response_defult.dart';
import 'package:app/app/models/pauta.dart';

abstract class IPautaRepository {
  Future<DefaultResponse> insert(Pauta pauta);

  Future<int> update(Pauta pauta);

  Future<int> delete(Pauta pauta);

  Future<Pauta> queryById(int id);

  Future<List<Pauta>> queryAllByIdUsuario();
}
