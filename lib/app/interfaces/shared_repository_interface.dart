import 'package:app/app/models/user.dart';

abstract class ISharedRepositoryInterface {
  Future<Usuario> getUsuarioLogado();

  Future<void> setUsuarioLogado(Usuario usuario);

  Future<void> removeUsuarioLogado();
}
