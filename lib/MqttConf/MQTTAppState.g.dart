// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MQTTAppState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MQTTAppState on MQTTAppStateBase, Store {
  Computed<String>? _$getReceivedTextComputed;

  @override
  String get getReceivedText => (_$getReceivedTextComputed ??= Computed<String>(
          () => super.getReceivedText,
          name: 'MQTTAppStateBase.getReceivedText'))
      .value;
  Computed<String>? _$getHistoryTextComputed;

  @override
  String get getHistoryText =>
      (_$getHistoryTextComputed ??= Computed<String>(() => super.getHistoryText,
              name: 'MQTTAppStateBase.getHistoryText'))
          .value;
  Computed<String>? _$getUpdateTopicComputed;

  @override
  String get getUpdateTopic =>
      (_$getUpdateTopicComputed ??= Computed<String>(() => super.getUpdateTopic,
              name: 'MQTTAppStateBase.getUpdateTopic'))
          .value;
  Computed<MQTTAppConnectionState>? _$getAppConnectionStateComputed;

  @override
  MQTTAppConnectionState get getAppConnectionState =>
      (_$getAppConnectionStateComputed ??= Computed<MQTTAppConnectionState>(
              () => super.getAppConnectionState,
              name: 'MQTTAppStateBase.getAppConnectionState'))
          .value;

  late final _$_appConnectionStateAtom =
      Atom(name: 'MQTTAppStateBase._appConnectionState', context: context);

  @override
  MQTTAppConnectionState get _appConnectionState {
    _$_appConnectionStateAtom.reportRead();
    return super._appConnectionState;
  }

  @override
  set _appConnectionState(MQTTAppConnectionState value) {
    _$_appConnectionStateAtom.reportWrite(value, super._appConnectionState, () {
      super._appConnectionState = value;
    });
  }

  late final _$_receivedTextAtom =
      Atom(name: 'MQTTAppStateBase._receivedText', context: context);

  @override
  String get _receivedText {
    _$_receivedTextAtom.reportRead();
    return super._receivedText;
  }

  @override
  set _receivedText(String value) {
    _$_receivedTextAtom.reportWrite(value, super._receivedText, () {
      super._receivedText = value;
    });
  }

  late final _$_historyTextAtom =
      Atom(name: 'MQTTAppStateBase._historyText', context: context);

  @override
  String get _historyText {
    _$_historyTextAtom.reportRead();
    return super._historyText;
  }

  @override
  set _historyText(String value) {
    _$_historyTextAtom.reportWrite(value, super._historyText, () {
      super._historyText = value;
    });
  }

  late final _$carregandoAtom =
      Atom(name: 'MQTTAppStateBase.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$hostLogadoAtom =
      Atom(name: 'MQTTAppStateBase.hostLogado', context: context);

  @override
  bool get hostLogado {
    _$hostLogadoAtom.reportRead();
    return super.hostLogado;
  }

  @override
  set hostLogado(bool value) {
    _$hostLogadoAtom.reportWrite(value, super.hostLogado, () {
      super.hostLogado = value;
    });
  }

  late final _$hostValidadoAtom =
      Atom(name: 'MQTTAppStateBase.hostValidado', context: context);

  @override
  bool get hostValidado {
    _$hostValidadoAtom.reportRead();
    return super.hostValidado;
  }

  @override
  set hostValidado(bool value) {
    _$hostValidadoAtom.reportWrite(value, super.hostValidado, () {
      super.hostValidado = value;
    });
  }

  late final _$_updateTopicAtom =
      Atom(name: 'MQTTAppStateBase._updateTopic', context: context);

  @override
  String get _updateTopic {
    _$_updateTopicAtom.reportRead();
    return super._updateTopic;
  }

  @override
  set _updateTopic(String value) {
    _$_updateTopicAtom.reportWrite(value, super._updateTopic, () {
      super._updateTopic = value;
    });
  }

  late final _$carregarAsyncAction =
      AsyncAction('MQTTAppStateBase.carregar', context: context);

  @override
  Future<void> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$MQTTAppStateBaseActionController =
      ActionController(name: 'MQTTAppStateBase', context: context);

  @override
  void setUpdateTopic(String topic) {
    final _$actionInfo = _$MQTTAppStateBaseActionController.startAction(
        name: 'MQTTAppStateBase.setUpdateTopic');
    try {
      return super.setUpdateTopic(topic);
    } finally {
      _$MQTTAppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReceivedText(String text) {
    final _$actionInfo = _$MQTTAppStateBaseActionController.startAction(
        name: 'MQTTAppStateBase.setReceivedText');
    try {
      return super.setReceivedText(text);
    } finally {
      _$MQTTAppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppConnectionState(MQTTAppConnectionState state) {
    final _$actionInfo = _$MQTTAppStateBaseActionController.startAction(
        name: 'MQTTAppStateBase.setAppConnectionState');
    try {
      return super.setAppConnectionState(state);
    } finally {
      _$MQTTAppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearText() {
    final _$actionInfo = _$MQTTAppStateBaseActionController.startAction(
        name: 'MQTTAppStateBase.clearText');
    try {
      return super.clearText();
    } finally {
      _$MQTTAppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  MQTTAppConnectionState appConnectionState() {
    final _$actionInfo = _$MQTTAppStateBaseActionController.startAction(
        name: 'MQTTAppStateBase.appConnectionState');
    try {
      return super.appConnectionState();
    } finally {
      _$MQTTAppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
hostLogado: ${hostLogado},
hostValidado: ${hostValidado},
getReceivedText: ${getReceivedText},
getHistoryText: ${getHistoryText},
getUpdateTopic: ${getUpdateTopic},
getAppConnectionState: ${getAppConnectionState}
    ''';
  }
}
