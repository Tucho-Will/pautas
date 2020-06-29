import 'package:app/app/app_widget.dart';
import 'package:app/app/controllers/pauta/pauta_controller.dart';
import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/interfaces/user_repository_interface.dart';
import 'package:app/app/repositories/shared_repository.dart';
import 'package:app/app/repositories/user_repository.dart';
import 'package:app/app/views/pages/home/home_page.dart';
import 'package:app/app/views/pages/initial/initial_page.dart';
import 'package:app/app/views/pages/login/login_page.dart';
import 'package:app/app/views/pages/pauta/pauta_page.dart';
import 'package:app/app/views/pages/perfil/perfil_page.dart';
import 'package:app/app/views/pages/recuperar_senha/recuperar_senha_page.dart';
import 'package:app/app/views/pages/usuario/usuario_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/auth/auth_controller.dart';
import 'interfaces/auth_repository_interface.dart';
import 'interfaces/shared_repository_interface.dart';
import 'repositories/auth_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => AuthController(),
        ),
        Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepositoryInterface>(
          (i) => AuthRepository(),
        ),
        Bind<IUserRepository>(
          (i) => UserRepository(),
        ),
        Bind(
          (i) => PautaController(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(
          RoutesConst.inicial,
          child: (_, args) => InitialPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          RoutesConst.login,
          child: (_, args) => LoginPage(),
        ),
        Router(
          RoutesConst.recuperar_senha,
          child: (_, args) => RecuperarSenhaPage(),
        ),
        Router(
          RoutesConst.novo_usuario,
          child: (_, args) => UsuarioPage(),
        ),
        Router(
          RoutesConst.home,
          child: (_, args) => HomePage(),
        ),
        Router(
          RoutesConst.perfil,
          child: (_, args) => PerfilPage(),
        ),
        Router(
          RoutesConst.nova_pauta,
          child: (_, args) => PautaPage(),
        ),
      ];
}
