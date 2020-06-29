import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/core/controller/base_controller.dart';
import 'package:app/app/core/notification/notification.service.dart';
import 'package:app/app/interfaces/pauta_repository_interface.dart';
import 'package:app/app/interfaces/shared_repository_interface.dart';
import 'package:app/app/models/pauta.dart';
import 'package:app/app/models/user.dart';
import 'package:app/app/repositories/pauta_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

part 'pauta_controller.g.dart';

class PautaController = _PautaControllerBase with _$PautaController;

abstract class _PautaControllerBase extends BaseController with Store {
  IPautaRepository _pautaRepository;
  ISharedRepositoryInterface _sharedRepository;

  _PautaControllerBase() {
    _pautaRepository = new PautaRepository();
    _sharedRepository = Modular.get<ISharedRepositoryInterface>();
  }

  @observable
  bool hasError = false;
  @observable
  bool isLoading = false;

  //Metodos utilizados na listagem da home
  @observable
  ObservableList<Pauta> abertas = ObservableList<Pauta>();
  @observable
  ObservableList<Pauta> finalizadas = ObservableList<Pauta>();

  //Metodos utilizados no cadastro de uma nova pauta
  @observable
  String titulo = '';
  @observable
  String descricao = '';
  @observable
  String detalhe = '';
  @observable
  Usuario user;

  @action
  void setUsuario(Usuario user) => this.user = user;

  @action
  void setTitulo(String titulo) => this.titulo = titulo;

  @action
  void setDescricao(String descricao) => this.descricao = descricao;

  @action
  void setDetalhe(String detalhe) => this.detalhe = detalhe;

  @computed
  bool get enableButton =>
      titulo.isNotEmpty && descricao.isNotEmpty && detalhe.isNotEmpty;

  @observable
  @action
  void changeLoading(bool val) {
    isLoading = val;
  }

  @action
  void changeError(bool val) {
    hasError = val;
  }

  Future<void> getData() async {
    executeAction(() async {
      try {
        List<Pauta> all = await _pautaRepository.queryAllByIdUsuario();
        processarPautas(all);
      } catch (e) {
        throw e;
      }
    }, changeLoading, changeError);
  }
  @action
  Future<void> salvarPauta() async {
    executeAction(() async {
      try {
        Pauta pauta = new Pauta(
            detalhe: detalhe,
            descricao: descricao,
            titulo: titulo,
            autor_id: user.id);
        final response = await _pautaRepository.insert(pauta);

        if (response.success) {
          //atualiza as imformações na listagem
          await getData();

          NotificationService.showToast(
            message: "Pauta foi gravada com sucesso !",
            type: NOTIFICATION_TYPE.sucess,
            position: ToastPosition.top,
            iconData: MdiIcons.checkOutline,
            textFontSize: 16,
          );

          Future.delayed(Duration.zero, () {
            Modular.to.pushReplacementNamed(RoutesConst.home);
          });
        }
      } catch (e) {
        throw e;
      }
    }, changeLoading, changeError);
  }

  Future<void> alterarStatus(Pauta pauta) async {
    executeAction(() async {
      try {
        pauta.status = pauta.status == 0 ? 1 : 0;
        await _pautaRepository.update(pauta);
        //Processo novamente com as informações do banco
        List<Pauta> all = await _pautaRepository.queryAllByIdUsuario();
        processarPautas(all);
      } catch (e) {
        throw e;
      }
    }, changeLoading, changeError);
  }

  void processarPautas(List pautas) {
    this.finalizadas.clear();
    this.abertas.clear();

    pautas.forEach((pauta) {
      //Status for igual a 0 aberto
      if (pauta.status == 1) {
        this.finalizadas.add(pauta);
      } else {
        this.abertas.add(pauta);
      }
    });
  }

  List<Pauta> getPautasByTab(int tab) {
    switch (tab) {
      case 1:
        return this.finalizadas;
        break;
      default:
        return this.abertas;
    }
  }

  @action
  Future<void> getUsuarioLogado() async {
    var usuario = await _sharedRepository.getUsuarioLogado();
    setUsuario(usuario);
  }

  @action
  Future<void> clearData() async {
    titulo = '';
    descricao = '';
    detalhe = '';
    user = null;
  }
}
