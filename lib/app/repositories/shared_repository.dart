import 'package:app/app/core/consts/shared_preferences_consts.dart';
import 'package:app/app/core/local_storage/preferences_storage.dart';
import 'package:app/app/interfaces/shared_repository_interface.dart';
import 'package:app/app/models/user.dart';

class SharedRepository implements ISharedRepositoryInterface {
  @override
  Future<Usuario> getUsuarioLogado() async {
    final preferences = await PreferencesStorage.getInstance();

    final idUsuario = preferences.get(SharedPreferencesConsts.usuario_id);
    if (idUsuario != null && idUsuario != 0) {
      final email = preferences.get(SharedPreferencesConsts.usuario_email);
      final nome = preferences.get(SharedPreferencesConsts.usuario_nome);
      return new Usuario(id: idUsuario, email: email, nome: nome);
    }
    return null;
  }

  @override
  Future<void> setUsuarioLogado(Usuario usuario) async {
    var preferences = await PreferencesStorage.getInstance();
    preferences.setInt(SharedPreferencesConsts.usuario_id, usuario.id);
    preferences.setString(SharedPreferencesConsts.usuario_email, usuario.email);
    preferences.setString(SharedPreferencesConsts.usuario_nome, usuario.nome);
  }

  @override
  Future<void> removeUsuarioLogado() async {
    var preferences = await PreferencesStorage.getInstance();
    preferences.remove(SharedPreferencesConsts.usuario_id);
    preferences.remove(SharedPreferencesConsts.usuario_email);
    preferences.remove(SharedPreferencesConsts.usuario_nome);
  }
}
