import 'package:app/app/core/response/response_defult.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthRepositoryInterface {
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});

  Future<DefaultResponse> doRegister(
      {@required String email,
      @required String password,
      @required String nome});

  Future<DefaultResponse> getUsuarioLogado();

  Future<DefaultResponse> logOut();
}
