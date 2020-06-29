import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/core/controller/base_controller.dart';
import 'package:app/app/core/email/email.send.dart';
import 'package:app/app/core/notification/notification.service.dart';
import 'package:app/app/interfaces/auth_repository_interface.dart';
import 'package:app/app/interfaces/shared_repository_interface.dart';
import 'package:app/app/interfaces/user_repository_interface.dart';
import 'package:app/app/models/user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase extends BaseController with Store {
  IAuthRepositoryInterface authRepository;
  ISharedRepositoryInterface _sharedRepository;
  IUserRepository _userRepository;

  _AuthControllerBase() {
    authRepository = Modular.get<IAuthRepositoryInterface>();
    _sharedRepository = Modular.get<ISharedRepositoryInterface>();
    _userRepository = Modular.get<IUserRepository>();
  }

  @observable
  bool hasError = false;
  @observable
  bool isLoading = false;
  @observable
  String message = '';
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String nome = '';
  @observable
  Usuario user;

  @action
  void changeLoading(bool val) {
    isLoading = val;
  }

  @action
  void changeError(bool val) {
    hasError = val;
  }

  @action
  void setUsuario(Usuario user) => this.user = user;

  @action
  void setNome(String nome) => this.nome = nome;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginEmail() async {
    executeAction(() async {
      try {
        message = '';
        final response = await authRepository.doLoginEmailPassword(
            email: email.trim(), password: password.trim());

        if (response.success) {
          await _sharedRepository.setUsuarioLogado(response.object);
          Modular.to.pushReplacementNamed(RoutesConst.home);
        } else {
          message = response.message;
        }
      } catch (e) {
        throw e;
      }
    }, changeLoading, changeError);
  }

  Future<void> doRetrievePassaword() async {
    executeAction(() async {
      var usuario = await _userRepository.queryByEmail(email);
      if (usuario != null) {
        var result = await EmailSend.sendMessage("Sua senha é ${usuario.senha}",
            usuario.email, "Recuperacao senha App Pautas");

        var message = result
            ? "Email enviado com sucesso"
            : "Ops, não foi possivel enviar o email";

        NotificationService.showToast(
          message: message,
          type: result ? NOTIFICATION_TYPE.sucess : NOTIFICATION_TYPE.warning,
          position: ToastPosition.top,
          iconData: result ? MdiIcons.checkOutline : null,
          textFontSize: 16,
        );

        Future.delayed(Duration.zero, () {
          Modular.to.pushReplacementNamed(RoutesConst.login);
        });
      } else {
        message = "Usuário inexistente";
      }
    }, changeLoading, changeError);
  }

  Future<void> doRegister() async {
    executeAction(() async {
      try {
        final response = await authRepository.doRegister(
            email: email.trim(), password: password.trim(), nome: nome.trim());

        if (response.success) {
          NotificationService.showToast(
            message: "Usuario criado com sucesso.",
            type: NOTIFICATION_TYPE.sucess,
            position: ToastPosition.top,
            iconData: MdiIcons.checkOutline,
            textFontSize: 16,
          );

          Future.delayed(Duration.zero, () {
            Modular.to.pushReplacementNamed(RoutesConst.login);
          });
        } else {
          message = response.message;
        }
      } catch (e) {
        throw e;
      }
    }, changeLoading, changeError);
  }

  Future<void> doLogout() async {
    executeAction(() async {
      var response = await authRepository.logOut();
      if (response.success) {
        setUsuario(null);
        Modular.to.pushReplacementNamed(RoutesConst.login);
      } else {
        throw response;
      }
    }, changeLoading, changeError);
  }

  Future<void> getUsuarioLogado() async {
    var usuario = await _sharedRepository.getUsuarioLogado();
    setUsuario(usuario);
  }
}
