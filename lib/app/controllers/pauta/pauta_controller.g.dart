// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pauta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PautaController on _PautaControllerBase, Store {
  Computed<bool> _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_PautaControllerBase.enableButton'))
          .value;

  final _$hasErrorAtom = Atom(name: '_PautaControllerBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PautaControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$abertasAtom = Atom(name: '_PautaControllerBase.abertas');

  @override
  ObservableList<Pauta> get abertas {
    _$abertasAtom.reportRead();
    return super.abertas;
  }

  @override
  set abertas(ObservableList<Pauta> value) {
    _$abertasAtom.reportWrite(value, super.abertas, () {
      super.abertas = value;
    });
  }

  final _$finalizadasAtom = Atom(name: '_PautaControllerBase.finalizadas');

  @override
  ObservableList<Pauta> get finalizadas {
    _$finalizadasAtom.reportRead();
    return super.finalizadas;
  }

  @override
  set finalizadas(ObservableList<Pauta> value) {
    _$finalizadasAtom.reportWrite(value, super.finalizadas, () {
      super.finalizadas = value;
    });
  }

  final _$tituloAtom = Atom(name: '_PautaControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_PautaControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$detalheAtom = Atom(name: '_PautaControllerBase.detalhe');

  @override
  String get detalhe {
    _$detalheAtom.reportRead();
    return super.detalhe;
  }

  @override
  set detalhe(String value) {
    _$detalheAtom.reportWrite(value, super.detalhe, () {
      super.detalhe = value;
    });
  }

  final _$userAtom = Atom(name: '_PautaControllerBase.user');

  @override
  Usuario get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$salvarPautaAsyncAction =
      AsyncAction('_PautaControllerBase.salvarPauta');

  @override
  Future<void> salvarPauta() {
    return _$salvarPautaAsyncAction.run(() => super.salvarPauta());
  }

  final _$getUsuarioLogadoAsyncAction =
      AsyncAction('_PautaControllerBase.getUsuarioLogado');

  @override
  Future<void> getUsuarioLogado() {
    return _$getUsuarioLogadoAsyncAction.run(() => super.getUsuarioLogado());
  }

  final _$clearDataAsyncAction = AsyncAction('_PautaControllerBase.clearData');

  @override
  Future<void> clearData() {
    return _$clearDataAsyncAction.run(() => super.clearData());
  }

  final _$_PautaControllerBaseActionController =
      ActionController(name: '_PautaControllerBase');

  @override
  void setUsuario(Usuario user) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setUsuario');
    try {
      return super.setUsuario(user);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitulo(String titulo) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setTitulo');
    try {
      return super.setTitulo(titulo);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String descricao) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setDescricao');
    try {
      return super.setDescricao(descricao);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDetalhe(String detalhe) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setDetalhe');
    try {
      return super.setDetalhe(detalhe);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading(bool val) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.changeLoading');
    try {
      return super.changeLoading(val);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeError(bool val) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.changeError');
    try {
      return super.changeError(val);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasError: ${hasError},
isLoading: ${isLoading},
abertas: ${abertas},
finalizadas: ${finalizadas},
titulo: ${titulo},
descricao: ${descricao},
detalhe: ${detalhe},
user: ${user},
enableButton: ${enableButton}
    ''';
  }
}
