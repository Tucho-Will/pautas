import 'package:app/app/core/response/response_defult.dart';
import 'package:app/app/interfaces/auth_repository_interface.dart';
import 'package:app/app/interfaces/shared_repository_interface.dart';
import 'package:app/app/interfaces/user_repository_interface.dart';
import 'package:app/app/models/user.dart';
import 'package:app/app/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository implements IAuthRepositoryInterface {
  ISharedRepositoryInterface _sharedRepository;
  IUserRepository _userRepository;

  AuthRepository() {
    _sharedRepository = Modular.get<ISharedRepositoryInterface>();
    _userRepository = new UserRepository();
  }

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      var usuario = await _userRepository.queryByEmailAndSenha(email, password);
      return DefaultResponse(
          object: usuario,
          success: usuario != null,
          message: 'Usuário inexistente ou senha inválida');
    } on Exception catch (e) {
      return DefaultResponse.Error(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getUsuarioLogado() async {
    try {
      var usuarioLogado = await _sharedRepository.getUsuarioLogado();
      return DefaultResponse(
          object: usuarioLogado, success: usuarioLogado != null);
    } on Exception catch (e) {
      return DefaultResponse.Error(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await _sharedRepository.removeUsuarioLogado();
      return DefaultResponse.Success();
    } on Exception catch (e) {
      return DefaultResponse.Error(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doRegister(
      {@required String email,
      @required String password,
      @required String nome}) async {
    try {
      var idUsuario = await _userRepository
          .insert(new Usuario(email: email, senha: password, nome: nome));
      return DefaultResponse(
          object: idUsuario,
          success: idUsuario != null,
          message: 'Usuario foi criado com sucesso');
    } on Exception catch (e) {
      return DefaultResponse.Error(object: e, message: e.toString());
    }
  }
}
