import 'package:app/app/models/user.dart';

abstract class IUserRepository {

  Future<int> insert(Usuario user);

  Future<int> update(Usuario user);

  Future<int> delete(Usuario user);

  Future<Usuario> queryById(int id);

  Future<Usuario> queryByEmailAndSenha(String email, String senha);

  Future<Usuario> queryByEmail(String email);
}
