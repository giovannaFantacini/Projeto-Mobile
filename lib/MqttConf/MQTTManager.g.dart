// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MQTTManager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MQTTManager on MQTTManagerBase, Store {
  Computed<String?>? _$hostComputed;

  @override
  String? get host => (_$hostComputed ??=
          Computed<String?>(() => super.host, name: 'MQTTManagerBase.host'))
      .value;
  Computed<MQTTAppState>? _$currentStateComputed;

  @override
  MQTTAppState get currentState => (_$currentStateComputed ??=
          Computed<MQTTAppState>(() => super.currentState,
              name: 'MQTTManagerBase.currentState'))
      .value;

  late final _$_currentStateAtom =
      Atom(name: 'MQTTManagerBase._currentState', context: context);

  @override
  MQTTAppState get _currentState {
    _$_currentStateAtom.reportRead();
    return super._currentState;
  }

  @override
  set _currentState(MQTTAppState value) {
    _$_currentStateAtom.reportWrite(value, super._currentState, () {
      super._currentState = value;
    });
  }

  late final _$_clientAtom =
      Atom(name: 'MQTTManagerBase._client', context: context);

  @override
  MqttServerClient? get _client {
    _$_clientAtom.reportRead();
    return super._client;
  }

  @override
  set _client(MqttServerClient? value) {
    _$_clientAtom.reportWrite(value, super._client, () {
      super._client = value;
    });
  }

  late final _$_identifierAtom =
      Atom(name: 'MQTTManagerBase._identifier', context: context);

  @override
  String? get _identifier {
    _$_identifierAtom.reportRead();
    return super._identifier;
  }

  @override
  set _identifier(String? value) {
    _$_identifierAtom.reportWrite(value, super._identifier, () {
      super._identifier = value;
    });
  }

  late final _$_hostAtom =
      Atom(name: 'MQTTManagerBase._host', context: context);

  @override
  String? get _host {
    _$_hostAtom.reportRead();
    return super._host;
  }

  @override
  set _host(String? value) {
    _$_hostAtom.reportWrite(value, super._host, () {
      super._host = value;
    });
  }

  late final _$_topicAtom =
      Atom(name: 'MQTTManagerBase._topic', context: context);

  @override
  String get _topic {
    _$_topicAtom.reportRead();
    return super._topic;
  }

  @override
  set _topic(String value) {
    _$_topicAtom.reportWrite(value, super._topic, () {
      super._topic = value;
    });
  }

  late final _$_portAtom =
      Atom(name: 'MQTTManagerBase._port', context: context);

  @override
  int? get _port {
    _$_portAtom.reportRead();
    return super._port;
  }

  @override
  set _port(int? value) {
    _$_portAtom.reportWrite(value, super._port, () {
      super._port = value;
    });
  }

  late final _$textReceivedAtom =
      Atom(name: 'MQTTManagerBase.textReceived', context: context);

  @override
  String get textReceived {
    _$textReceivedAtom.reportRead();
    return super.textReceived;
  }

  @override
  set textReceived(String value) {
    _$textReceivedAtom.reportWrite(value, super.textReceived, () {
      super.textReceived = value;
    });
  }

  @override
  String toString() {
    return '''
textReceived: ${textReceived},
host: ${host},
currentState: ${currentState}
    ''';
  }
}
